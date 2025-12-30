"""
Claude API client for FINMA Career Coach.
Version 2: Integrated with reference materials and system prompts.
"""

import os
from typing import List, Dict, Optional
from anthropic import Anthropic
from .content_loader import ContentLoader
from .prompts import build_system_message_with_context, build_user_profile_context


class ClaudeCareerCoach:
    """Career coach using Claude API with reference materials."""

    def __init__(self, use_caching: bool = True, test_mode: bool = True, use_summaries: bool = True):
        """
        Initialize the career coach.

        Args:
            use_caching: Whether to use prompt caching (default: True)
            test_mode: If True, only load 3 role profiles (default: True for safety)
                      Set to False for production with all 20 roles
            use_summaries: If True, load role summaries (default: True for efficiency)
                          Set to False to load full profiles
        """
        api_key = os.environ.get("ANTHROPIC_API_KEY")
        if not api_key:
            raise ValueError("ANTHROPIC_API_KEY environment variable not set")

        self.client = Anthropic(api_key=api_key)
        self.model = "claude-sonnet-4-5-20250929"
        self.use_caching = use_caching
        self.test_mode = test_mode
        self.use_summaries = use_summaries

        # Load reference materials
        print("Loading reference materials...")
        self.loader = ContentLoader(test_mode=test_mode, use_summaries=use_summaries)
        self.reference_context = self.loader.build_cached_context()
        print(f"✓ Loaded {len(self.loader.load_role_profiles())} role profiles")

        # Build system message (with or without caching)
        if self.use_caching:
            self.system_message = build_system_message_with_context(self.reference_context)
        else:
            # Without caching, just combine into single text
            from .prompts import SYSTEM_PROMPT
            self.system_message = f"{SYSTEM_PROMPT}\n\n# REFERENCE MATERIALS\n\n{self.reference_context}"

        # Define tools for fetching detailed role profiles
        self.tools = [
            {
                "name": "get_detailed_role_profile",
                "description": "Fetch the complete detailed profile for a specific role when the summary doesn't provide enough information. Use this when a student asks for in-depth details about day-to-day work, comprehensive skill requirements, detailed career progression, or specific examples.",
                "input_schema": {
                    "type": "object",
                    "properties": {
                        "role_name": {
                            "type": "string",
                            "description": "The exact name of the role (e.g., 'ecm_analyst_boutique_advisory', 'trader_sales_and_trading'). Must match the role filename without .typ extension."
                        }
                    },
                    "required": ["role_name"]
                }
            }
        ]

    def _execute_tool(self, tool_name: str, tool_input: Dict) -> str:
        """Execute a tool and return the result."""
        if tool_name == "get_detailed_role_profile":
            role_name = tool_input.get("role_name")
            try:
                full_profile = self.loader.load_full_role_profile(role_name)
                return full_profile
            except FileNotFoundError:
                available_roles = self.loader.get_available_roles()
                return f"Error: Role '{role_name}' not found. Available roles: {', '.join(available_roles)}"
        else:
            return f"Error: Unknown tool '{tool_name}'"

    def chat(
        self,
        user_message: str,
        conversation_history: Optional[List[Dict]] = None,
        user_profile: Optional[Dict] = None
    ) -> str:
        """
        Send a message to Claude and get a response.
        Handles tool use for fetching detailed role profiles when needed.

        Args:
            user_message: The user's question or message
            conversation_history: Previous conversation messages (optional)
            user_profile: User profile information (optional)

        Returns:
            Claude's response as a string
        """
        # Build messages list
        messages = []

        # Add conversation history if provided
        if conversation_history:
            messages.extend(conversation_history)

        # Add user profile context to the current message if provided
        current_message = user_message
        if user_profile:
            profile_context = build_user_profile_context(user_profile)
            if profile_context:
                current_message = f"{profile_context}\n\n{user_message}"

        # Add current user message
        messages.append({
            "role": "user",
            "content": current_message
        })

        # Make API call with tool support (only if using summaries)
        api_params = {
            "model": self.model,
            "max_tokens": 4096,
            "system": self.system_message,
            "messages": messages
        }

        # Add tools if using summaries
        if self.use_summaries:
            api_params["tools"] = self.tools

        response = self.client.messages.create(**api_params)

        # Handle tool use in a loop (Claude might call multiple tools)
        while response.stop_reason == "tool_use":
            # Extract tool uses from response
            tool_uses = [block for block in response.content if block.type == "tool_use"]

            # Add assistant's response (including tool uses) to messages
            messages.append({
                "role": "assistant",
                "content": response.content
            })

            # Execute each tool and collect results
            tool_results = []
            for tool_use in tool_uses:
                result = self._execute_tool(tool_use.name, tool_use.input)
                tool_results.append({
                    "type": "tool_result",
                    "tool_use_id": tool_use.id,
                    "content": result
                })

            # Add tool results to messages
            messages.append({
                "role": "user",
                "content": tool_results
            })

            # Get next response from Claude
            api_params["messages"] = messages
            response = self.client.messages.create(**api_params)

        # Extract final text response
        text_content = [block.text for block in response.content if hasattr(block, 'text')]
        return "\n".join(text_content) if text_content else ""


if __name__ == "__main__":
    # Test with reference materials
    print("\n" + "=" * 60)
    print("Testing FINMA Career Coach")
    print("=" * 60 + "\n")

    coach = ClaudeCareerCoach(use_caching=True)

    # Test 1: Ask about a specific role
    print("Test 1: Asking about a trader role")
    print("-" * 60)
    response = coach.chat("What does a trader do in Sales & Trading? Give me a brief overview.")
    print(f"Coach: {response}\n")

    # Test 2: Ask for career advice with profile
    print("\nTest 2: Career advice with student profile")
    print("-" * 60)
    student_profile = {
        "degree": "Bachelor of Finance",
        "year": "3rd year",
        "interests": ["markets", "quantitative analysis"],
        "skills": ["Python", "Excel"]
    }

    response = coach.chat(
        "What roles might suit me?",
        user_profile=student_profile
    )
    print(f"Coach: {response}\n")

    # Test 3: Follow-up question (with conversation history)
    print("\nTest 3: Follow-up question")
    print("-" * 60)
    history = [
        {"role": "user", "content": "What does a trader do?"},
        {"role": "assistant", "content": "Traders buy and sell financial instruments..."}
    ]

    response = coach.chat(
        "What skills do I need for that role?",
        conversation_history=history
    )
    print(f"Coach: {response}\n")

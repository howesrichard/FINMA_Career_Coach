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

    def __init__(self, use_caching: bool = True, test_mode: bool = True):
        """
        Initialize the career coach.

        Args:
            use_caching: Whether to use prompt caching (default: True)
            test_mode: If True, only load 3 role profiles (default: True for safety)
                      Set to False for production with all 20 roles
        """
        api_key = os.environ.get("ANTHROPIC_API_KEY")
        if not api_key:
            raise ValueError("ANTHROPIC_API_KEY environment variable not set")

        self.client = Anthropic(api_key=api_key)
        self.model = "claude-sonnet-4-5-20250929"
        self.use_caching = use_caching
        self.test_mode = test_mode

        # Load reference materials
        print("Loading reference materials...")
        loader = ContentLoader(test_mode=test_mode)
        self.reference_context = loader.build_cached_context()
        print(f"✓ Loaded {len(loader.load_role_profiles())} role profiles")

        # Build system message (with or without caching)
        if self.use_caching:
            self.system_message = build_system_message_with_context(self.reference_context)
        else:
            # Without caching, just combine into single text
            from .prompts import SYSTEM_PROMPT
            self.system_message = f"{SYSTEM_PROMPT}\n\n# REFERENCE MATERIALS\n\n{self.reference_context}"

    def chat(
        self,
        user_message: str,
        conversation_history: Optional[List[Dict]] = None,
        user_profile: Optional[Dict] = None
    ) -> str:
        """
        Send a message to Claude and get a response.

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

        # Make API call
        if self.use_caching:
            # With caching: system message is a list of content blocks
            response = self.client.messages.create(
                model=self.model,
                max_tokens=4096,
                system=self.system_message,
                messages=messages
            )
        else:
            # Without caching: system message is a simple string
            response = self.client.messages.create(
                model=self.model,
                max_tokens=4096,
                system=self.system_message,
                messages=messages
            )

        return response.content[0].text


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

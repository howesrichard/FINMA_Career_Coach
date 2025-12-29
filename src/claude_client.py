"""
Simple Claude API client for career coaching.
Version 1: Basic API call without caching.
"""

import os
from anthropic import Anthropic


class ClaudeCareerCoach:
    """Simple career coach using Claude API."""

    def __init__(self):
        """Initialize the Anthropic client."""
        api_key = os.environ.get("ANTHROPIC_API_KEY")
        if not api_key:
            raise ValueError("ANTHROPIC_API_KEY environment variable not set")

        self.client = Anthropic(api_key=api_key)
        self.model = "claude-sonnet-4-5-20250929"

    def chat(self, user_message: str) -> str:
        """
        Send a message to Claude and get a response.

        Args:
            user_message: The user's question or message

        Returns:
            Claude's response as a string
        """
        response = self.client.messages.create(
            model=self.model,
            max_tokens=2048,
            messages=[
                {"role": "user", "content": user_message}
            ]
        )

        return response.content[0].text


if __name__ == "__main__":
    # Simple test
    coach = ClaudeCareerCoach()
    response = coach.chat("What is a trader in finance?")
    print(f"Claude: {response}")

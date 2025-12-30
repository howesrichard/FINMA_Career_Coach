#!/usr/bin/env python3
"""
Test that Claude can successfully fetch full role profiles via tool calling.
"""

from src.claude_client import ClaudeCareerCoach

print("=" * 70)
print("Testing Tool Calling - Summary → Full Profile Fetch")
print("=" * 70)

# Initialize with summaries enabled
print("\nInitializing coach with summaries (test mode)...")
coach = ClaudeCareerCoach(use_caching=True, test_mode=True, use_summaries=True)

print("\n" + "=" * 70)
print("Test Question (should trigger full profile fetch)")
print("=" * 70)

# This question requires detailed information that's only in full profiles
question = """
I'm interested in the ECM Analyst role. Can you tell me specifically:
1. What does a typical day look like with actual time breakdowns?
2. What specific tools and software do they use?
3. Can you give me an example of a real deal they might work on?

I want detailed examples, not just high-level descriptions.
"""

print(f"\nQuestion: {question}\n")
print("-" * 70)
print("Sending to Claude... (watch for tool calling)\n")

response = coach.chat(question)

print("=" * 70)
print("Claude's Response:")
print("=" * 70)
print(response)

print("\n" + "=" * 70)
print("✅ Test Complete")
print("=" * 70)
print("""
If Claude provided detailed day-in-the-life examples with specific times,
deal examples, and detailed workflows, the tool calling is working!

The full profile should have been fetched automatically to answer this
detailed question that summaries alone couldn't handle.
""")

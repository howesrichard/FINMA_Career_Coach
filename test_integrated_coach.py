"""
Simple test of the integrated career coach.
Run this after rate limits reset.
"""

from src.claude_client import ClaudeCareerCoach

print("=" * 60)
print("FINMA Career Coach - Integration Test")
print("=" * 60)
print()

# Initialize with caching
print("Initializing coach with prompt caching...")
coach = ClaudeCareerCoach(use_caching=True)
print("✓ Ready!\n")

# Single test question
print("Question: What does a quant researcher do at a hedge fund?")
print("-" * 60)

response = coach.chat("What does a quant researcher do at a hedge fund? Give me a 2-paragraph overview.")

print(f"\nCoach Response:\n{response}\n")

print("=" * 60)
print("✓ Test complete!")
print("\nNote: With prompt caching enabled, the ~168k token")
print("reference materials are cached and reused across requests,")
print("saving 90%+ on API costs for subsequent questions.")

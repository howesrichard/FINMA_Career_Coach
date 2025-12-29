"""
Demonstrate test mode - much cheaper for development/testing!
Shows exact token count comparison between full and test modes.
"""

import os
from anthropic import Anthropic
from src.claude_client import ClaudeCareerCoach
from src.content_loader import ContentLoader

def count_tokens(client: Anthropic, text: str) -> int:
    """Count exact tokens using Anthropic API."""
    response = client.messages.count_tokens(
        model="claude-sonnet-4-5-20250929",
        messages=[{"role": "user", "content": text}]
    )
    return response.input_tokens

print("=" * 60)
print("Test Mode Demo - Token Count Comparison")
print("=" * 60)
print()

# Initialize Anthropic client for token counting
client = Anthropic(api_key=os.environ.get("ANTHROPIC_API_KEY"))

# Count tokens for FULL mode
print("Analyzing FULL mode (all 20 roles)...")
full_loader = ContentLoader(test_mode=False)
full_context = full_loader.build_cached_context()
full_tokens = count_tokens(client, full_context)
print(f"  Roles loaded: {len(full_loader.load_role_profiles())}")
print(f"  Context tokens: {full_tokens:,}")
print()

# Count tokens for TEST mode
print("Analyzing TEST mode (3 shortest roles)...")
test_loader = ContentLoader(test_mode=True)
test_context = test_loader.build_cached_context()
test_tokens = count_tokens(client, test_context)
print(f"  Roles loaded: {len(test_loader.load_role_profiles())}")
print(f"  Context tokens: {test_tokens:,}")
print()

# Calculate savings
savings = full_tokens - test_tokens
savings_pct = (savings / full_tokens) * 100

print("=" * 60)
print("TOKEN COMPARISON SUMMARY")
print("=" * 60)
print(f"Full mode:  {full_tokens:>7,} tokens")
print(f"Test mode:  {test_tokens:>7,} tokens")
print(f"Savings:    {savings:>7,} tokens ({savings_pct:.1f}% reduction)")
print()

# Cost estimation (approximate based on Claude pricing)
# Input tokens: $3/million for Sonnet
cost_per_million = 3.0
full_cost = (full_tokens / 1_000_000) * cost_per_million
test_cost = (test_tokens / 1_000_000) * cost_per_million

print("Estimated cost per API call (without caching):")
print(f"  Full mode: ${full_cost:.4f}")
print(f"  Test mode: ${test_cost:.4f}")
print(f"  Savings:   ${full_cost - test_cost:.4f} per call")
print()

# With prompt caching (90% discount on cached tokens)
cache_discount = 0.9
full_cached_cost = (full_tokens / 1_000_000) * cost_per_million * (1 - cache_discount)
test_cached_cost = (test_tokens / 1_000_000) * cost_per_million * (1 - cache_discount)

print("Estimated cost per call (WITH prompt caching on subsequent calls):")
print(f"  Full mode: ${full_cached_cost:.5f}")
print(f"  Test mode: ${test_cached_cost:.5f}")
print()

print("=" * 60)
print("LIVE TEST - Asking Coach a Question")
print("=" * 60)
print()

print("Initializing coach in TEST MODE...")
coach = ClaudeCareerCoach(use_caching=True, test_mode=True)

print()
print("Question: What does a quant do?")
print("-" * 60)

response = coach.chat("What does a quant do? Give me a brief 2-paragraph answer.")

print(f"\nCoach Response:\n{response}\n")

print("=" * 60)
print("✓ Demo complete!")
print()
print("Recommendation: Use test_mode=True during development,")
print("then switch to test_mode=False for production.")

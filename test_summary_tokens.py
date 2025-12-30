#!/usr/bin/env python3
"""
Test token usage with summary-based approach vs full profiles.
"""

import os
from anthropic import Anthropic
from src.content_loader import ContentLoader
from src.prompts import build_system_message_with_context

client = Anthropic(api_key=os.environ.get("ANTHROPIC_API_KEY"))

print("=" * 70)
print("Token Usage Comparison: Summaries vs Full Profiles")
print("=" * 70)

# Test message
test_message = "What roles might suit someone interested in quantitative analysis and markets?"

# Test 1: Full profiles (all 20)
print("\n1️⃣  FULL PROFILES (All 20 roles)")
print("-" * 70)
loader_full = ContentLoader(test_mode=False, use_summaries=False)
context_full = loader_full.build_cached_context()
system_full = build_system_message_with_context(context_full)

response_full = client.messages.count_tokens(
    model="claude-sonnet-4-5-20250929",
    system=system_full,
    messages=[{"role": "user", "content": test_message}]
)

print(f"Input tokens: {response_full.input_tokens:,}")
print(f"Characters: {len(context_full):,}")
print(f"Char/token ratio: {len(context_full)/response_full.input_tokens:.2f}")

# Test 2: Summaries (all 20)
print("\n2️⃣  SUMMARIES (All 20 roles)")
print("-" * 70)
loader_summary = ContentLoader(test_mode=False, use_summaries=True)
context_summary = loader_summary.build_cached_context()
system_summary = build_system_message_with_context(context_summary)

response_summary = client.messages.count_tokens(
    model="claude-sonnet-4-5-20250929",
    system=system_summary,
    messages=[{"role": "user", "content": test_message}]
)

print(f"Input tokens: {response_summary.input_tokens:,}")
print(f"Characters: {len(context_summary):,}")
print(f"Char/token ratio: {len(context_summary)/response_summary.input_tokens:.2f}")

# Test 3: Test mode with full profiles (3 roles)
print("\n3️⃣  TEST MODE - FULL PROFILES (3 shortest roles)")
print("-" * 70)
loader_test_full = ContentLoader(test_mode=True, use_summaries=False)
context_test_full = loader_test_full.build_cached_context()
system_test_full = build_system_message_with_context(context_test_full)

response_test_full = client.messages.count_tokens(
    model="claude-sonnet-4-5-20250929",
    system=system_test_full,
    messages=[{"role": "user", "content": test_message}]
)

print(f"Input tokens: {response_test_full.input_tokens:,}")
print(f"Characters: {len(context_test_full):,}")

# Test 4: Test mode with summaries (3 roles)
print("\n4️⃣  TEST MODE - SUMMARIES (3 shortest roles)")
print("-" * 70)
loader_test_summary = ContentLoader(test_mode=True, use_summaries=True)
context_test_summary = loader_test_summary.build_cached_context()
system_test_summary = build_system_message_with_context(context_test_summary)

response_test_summary = client.messages.count_tokens(
    model="claude-sonnet-4-5-20250929",
    system=system_test_summary,
    messages=[{"role": "user", "content": test_message}]
)

print(f"Input tokens: {response_test_summary.input_tokens:,}")
print(f"Characters: {len(context_test_summary):,}")

# Summary comparison
print("\n" + "=" * 70)
print("📊 SUMMARY COMPARISON")
print("=" * 70)

full_tokens = response_full.input_tokens
summary_tokens = response_summary.input_tokens
test_full_tokens = response_test_full.input_tokens
test_summary_tokens = response_test_summary.input_tokens

print(f"\n{'Mode':<35} {'Tokens':>15} {'Reduction':>15}")
print("-" * 70)
print(f"{'Full profiles (20 roles)':<35} {full_tokens:>15,} {'baseline':>15}")
print(f"{'Summaries (20 roles)':<35} {summary_tokens:>15,} {f'-{(1-summary_tokens/full_tokens)*100:.1f}%':>15}")
print(f"{'Test mode full (3 roles)':<35} {test_full_tokens:>15,} {f'-{(1-test_full_tokens/full_tokens)*100:.1f}%':>15}")
print(f"{'Test mode summaries (3 roles)':<35} {test_summary_tokens:>15,} {f'-{(1-test_summary_tokens/full_tokens)*100:.1f}%':>15}")

# Cost comparison (using Claude Sonnet 4.5 pricing: $3/1M input, $15/1M output)
print("\n" + "=" * 70)
print("💰 COST PER REQUEST (input only, no caching)")
print("=" * 70)

input_cost_per_1m = 3.00

full_cost = (full_tokens / 1_000_000) * input_cost_per_1m
summary_cost = (summary_tokens / 1_000_000) * input_cost_per_1m
test_full_cost = (test_full_tokens / 1_000_000) * input_cost_per_1m
test_summary_cost = (test_summary_tokens / 1_000_000) * input_cost_per_1m

print(f"\n{'Mode':<35} {'Cost':>15} {'vs Full':>15}")
print("-" * 70)
print(f"{'Full profiles (20 roles)':<35} {'$' + f'{full_cost:.4f}':>15} {'baseline':>15}")
print(f"{'Summaries (20 roles)':<35} {'$' + f'{summary_cost:.4f}':>15} {f'-{(1-summary_cost/full_cost)*100:.1f}%':>15}")
print(f"{'Test mode full (3 roles)':<35} {'$' + f'{test_full_cost:.4f}':>15} {f'-{(1-test_full_cost/full_cost)*100:.1f}%':>15}")
print(f"{'Test mode summaries (3 roles)':<35} {'$' + f'{test_summary_cost:.4f}':>15} {f'-{(1-test_summary_cost/full_cost)*100:.1f}%':>15}")

# With caching (90% reduction on cached tokens)
print("\n" + "=" * 70)
print("💰 COST PER REQUEST (with prompt caching)")
print("=" * 70)
print("Note: 90% discount on cached tokens after first request\n")

# Cached cost is 10% of normal (90% discount)
cached_cost_per_1m = input_cost_per_1m * 0.1

full_cost_cached = (full_tokens / 1_000_000) * cached_cost_per_1m
summary_cost_cached = (summary_tokens / 1_000_000) * cached_cost_per_1m

print(f"{'Mode':<35} {'First':>15} {'Subsequent':>15}")
print("-" * 70)
print(f"{'Full profiles (20 roles)':<35} {'$' + f'{full_cost:.4f}':>15} {'$' + f'{full_cost_cached:.5f}':>15}")
print(f"{'Summaries (20 roles)':<35} {'$' + f'{summary_cost:.4f}':>15} {'$' + f'{summary_cost_cached:.5f}':>15}")

print("\n" + "=" * 70)
print("✅ RECOMMENDATION")
print("=" * 70)
print(f"""
Current default: Test mode + Summaries
- Development: {test_summary_tokens:,} tokens (${test_summary_cost:.5f} per request)
- Production: {summary_tokens:,} tokens (${summary_cost:.4f} first, ${summary_cost_cached:.5f} subsequent)
- Savings vs full: {(1-summary_tokens/full_tokens)*100:.1f}% fewer tokens
- Claude can fetch full profiles via tool calls when needed
""")

"""
Get exact token count for our reference materials using Anthropic's API.
"""

import os
from anthropic import Anthropic
from src.content_loader import ContentLoader


def count_tokens(client: Anthropic, text: str) -> int:
    """
    Use Anthropic's API to get exact token count.

    Args:
        client: Anthropic client instance
        text: The text to count tokens for

    Returns:
        Exact number of tokens
    """
    # Use the beta token counting endpoint
    response = client.messages.count_tokens(
        model="claude-sonnet-4-5-20250929",
        messages=[{"role": "user", "content": text}]
    )

    return response.input_tokens


if __name__ == "__main__":
    print("Loading reference materials...\n")

    client = Anthropic(api_key=os.environ.get("ANTHROPIC_API_KEY"))
    loader = ContentLoader()

    # Get taxonomy
    taxonomy = loader.load_taxonomy()
    taxonomy_tokens = count_tokens(client, taxonomy)

    print(f"Taxonomy:")
    print(f"  Characters: {len(taxonomy):,}")
    print(f"  Exact tokens: {taxonomy_tokens:,}")
    print(f"  Ratio: {len(taxonomy)/taxonomy_tokens:.2f} chars/token\n")

    # Get all role profiles
    profiles = loader.load_role_profiles()

    total_profile_chars = 0
    total_profile_tokens = 0

    print(f"Role Profiles ({len(profiles)} roles):")
    for role_name, content in sorted(profiles.items()):
        tokens = count_tokens(client, content)
        total_profile_chars += len(content)
        total_profile_tokens += tokens
        print(f"  {role_name}: {len(content):,} chars, {tokens:,} tokens")

    print(f"\n  Total profiles: {total_profile_chars:,} chars, {total_profile_tokens:,} tokens")
    print(f"  Average ratio: {total_profile_chars/total_profile_tokens:.2f} chars/token\n")

    # Get combined cached context
    cached_context = loader.build_cached_context()
    total_tokens = count_tokens(client, cached_context)

    print("=" * 60)
    print("COMPLETE CACHED CONTEXT:")
    print("=" * 60)
    print(f"Total characters: {len(cached_context):,}")
    print(f"Exact tokens: {total_tokens:,}")
    print(f"Ratio: {len(cached_context)/total_tokens:.2f} chars/token")
    print()
    print(f"Claude context window: 200,000 tokens")
    print(f"Reference materials: {total_tokens:,} tokens")
    print(f"Remaining for conversation: {200000 - total_tokens:,} tokens")
    print(f"Percentage used: {(total_tokens/200000)*100:.1f}%")
    print()

    # Project to 100 roles
    avg_tokens_per_role = total_profile_tokens / len(profiles)
    projected_100_roles = taxonomy_tokens + (avg_tokens_per_role * 100)

    print("=" * 60)
    print("PROJECTION TO 100 ROLES:")
    print("=" * 60)
    print(f"Current roles: {len(profiles)}")
    print(f"Average tokens per role: {avg_tokens_per_role:,.0f}")
    print(f"Projected 100 roles: {projected_100_roles:,.0f} tokens")
    print(f"Fits in context? {'YES ✓' if projected_100_roles < 200000 else 'NO ✗'}")
    print(f"Would use: {(projected_100_roles/200000)*100:.1f}% of context")

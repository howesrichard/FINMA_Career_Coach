#!/usr/bin/env python3
"""
Generate summary versions of role profiles using Claude.

This script processes full role profiles and creates concise summaries
suitable for loading into the career coach's initial context.
"""

import os
import sys
from pathlib import Path
from anthropic import Anthropic

# Add parent directory to path so we can import from src
sys.path.insert(0, str(Path(__file__).parent.parent))

client = Anthropic(api_key=os.environ.get("ANTHROPIC_API_KEY"))

STRUCTURED_SUMMARY_PROMPT = """
Create a structured summary of this role profile in the exact format below.

# [Role Title]

## Overview
[1-2 sentence description of the role]

## Core Responsibilities
[6 responsibilities, each approximately 175 characters including spaces]
- [responsibility 1]
- [responsibility 2]
- [responsibility 3]
- [responsibility 4]
- [responsibility 5]
- [responsibility 6]

## Key Skills Required

### [Skill Category 1]
[Up to 10 skills total across up to 3 categories, 100 characters per skill including spaces]
- [skill 1]
- [skill 2]
- [skill 3]

### [Skill Category 2]
- [skill 4]
- [skill 5]
- [skill 6]

### [Skill Category 3]
- [skill 7]
- [skill 8]
- [skill 9]
- [skill 10]

## Work Mode
[5 work modes, each with examples of tasks, 225 characters total per mode including spaces]

### [Mode 1 Name] (X-Y%)
[Brief description and examples of tasks in this mode]

### [Mode 2 Name] (X-Y%)
[Brief description and examples of tasks in this mode]

### [Mode 3 Name] (X-Y%)
[Brief description and examples of tasks in this mode]

### [Mode 4 Name] (X-Y%)
[Brief description and examples of tasks in this mode]

### [Mode 5 Name] (X-Y%)
[Brief description and examples of tasks in this mode]

## Workplace Culture
[175 characters including spaces - one line summary of workplace culture, work environment, and team dynamics]

## Career Path
- Entry: [entry-level role]
- Progression: [typical advancement path]

## Salary Range
[if mentioned in original, include all levels detailed]

## When to Request Full Profile
This summary covers the essentials. Request the detailed profile if the student wants:
- Detailed day-in-the-life examples
- Comprehensive skill development pathways
- In-depth due diligence or technical process details
- Extensive career progression scenarios
- Detailed compensation breakdowns across all levels

---

Full role profile to summarize:

{role_content}
"""


def generate_summary(role_content: str, role_name: str) -> str:
    """Generate a summary of a role profile using Claude.

    Args:
        role_content: Full content of the role profile
        role_name: Name of the role (for display purposes)

    Returns:
        Generated summary text
    """
    print(f"  Generating summary using Claude API...")

    response = client.messages.create(
        model="claude-sonnet-4-5-20250929",
        max_tokens=2000,
        messages=[{
            "role": "user",
            "content": STRUCTURED_SUMMARY_PROMPT.format(role_content=role_content)
        }]
    )

    return response.content[0].text


def process_role_file(input_path: Path, output_path: Path, force: bool = False) -> bool:
    """Process a single role file and generate its summary.

    Args:
        input_path: Path to the full role profile
        output_path: Path where summary should be saved
        force: If True, regenerate even if summary exists and is newer

    Returns:
        True if summary was generated, False if skipped
    """
    role_name = input_path.stem

    # Check if we need to regenerate
    if output_path.exists() and not force:
        if output_path.stat().st_mtime > input_path.stat().st_mtime:
            print(f"⏭️  Skipping {role_name} (summary is up to date)")
            return False

    print(f"\n📄 Processing: {role_name}")

    # Read full profile
    with open(input_path, 'r', encoding='utf-8') as f:
        full_content = f.read()

    print(f"  Full profile: {len(full_content):,} characters")

    # Generate summary
    summary = generate_summary(full_content, role_name)

    # Save summary
    output_path.parent.mkdir(parents=True, exist_ok=True)
    with open(output_path, 'w', encoding='utf-8') as f:
        f.write(summary)

    print(f"  ✅ Summary saved: {len(summary):,} characters")
    print(f"  📉 Reduction: {(1 - len(summary)/len(full_content))*100:.1f}%")

    return True


def main():
    """Main function to process all role files."""
    import argparse

    parser = argparse.ArgumentParser(description="Generate role profile summaries")
    parser.add_argument(
        '--roles',
        help='Comma-separated list of specific roles to process (without .typ extension)',
        type=str
    )
    parser.add_argument(
        '--all',
        action='store_true',
        help='Process all role files'
    )
    parser.add_argument(
        '--force',
        action='store_true',
        help='Regenerate summaries even if they exist and are up to date'
    )

    args = parser.parse_args()

    # Determine project root
    project_root = Path(__file__).parent.parent
    roles_dir = project_root / "reference" / "roles"
    summaries_dir = project_root / "reference" / "roles_summary"

    if not roles_dir.exists():
        print(f"❌ Error: Roles directory not found: {roles_dir}")
        sys.exit(1)

    # Get list of files to process
    if args.roles:
        # Process specific roles
        role_names = [r.strip() for r in args.roles.split(',')]
        role_files = [roles_dir / f"{name}.typ" for name in role_names]

        # Check all files exist
        for role_file in role_files:
            if not role_file.exists():
                print(f"❌ Error: Role file not found: {role_file}")
                sys.exit(1)
    else:
        # Process all .typ files
        role_files = sorted(roles_dir.glob("*.typ"))

    if not role_files:
        print("❌ No role files found to process")
        sys.exit(1)

    print(f"🚀 Starting summary generation")
    print(f"📁 Input:  {roles_dir}")
    print(f"📁 Output: {summaries_dir}")
    print(f"📊 Files to process: {len(role_files)}")

    # Process each file
    processed = 0
    skipped = 0

    for role_file in role_files:
        output_file = summaries_dir / role_file.name

        if process_role_file(role_file, output_file, force=args.force):
            processed += 1
        else:
            skipped += 1

    # Summary
    print(f"\n{'='*60}")
    print(f"✅ Complete!")
    print(f"   Processed: {processed}")
    print(f"   Skipped:   {skipped}")
    print(f"   Total:     {len(role_files)}")

    if processed > 0:
        # Estimate costs (rough calculation)
        # Average role is ~8000 chars = ~2000 tokens input
        # Average summary is ~1000 chars = ~250 tokens output
        input_tokens = processed * 2000
        output_tokens = processed * 250
        input_cost = (input_tokens / 1_000_000) * 3.00  # $3 per 1M input tokens
        output_cost = (output_tokens / 1_000_000) * 15.00  # $15 per 1M output tokens
        total_cost = input_cost + output_cost

        print(f"\n💰 Estimated cost: ${total_cost:.3f}")
        print(f"   ({input_tokens:,} input + {output_tokens:,} output tokens)")


if __name__ == "__main__":
    main()

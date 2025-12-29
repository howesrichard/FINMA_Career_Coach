"""
Content loader for reference materials (role profiles and taxonomy).
Version 1: Simple file loading without parsing.
"""

import os
from pathlib import Path
from typing import Dict


class ContentLoader:
    """Loads reference materials from .typ files."""

    def __init__(self, reference_path: str = None, test_mode: bool = False):
        """
        Initialize the content loader.

        Args:
            reference_path: Path to reference folder. If None, uses default.
            test_mode: If True, only load 3 shortest role profiles (for testing)
        """
        if reference_path is None:
            # Default: reference folder in project root
            project_root = Path(__file__).parent.parent
            reference_path = project_root / "reference"

        self.reference_path = Path(reference_path)
        self.roles_path = self.reference_path / "roles"
        self.taxonomy_path = self.reference_path / "Financial_insto_taxonomy.typ"
        self.test_mode = test_mode

        # Validate paths exist
        if not self.reference_path.exists():
            raise FileNotFoundError(f"Reference folder not found: {self.reference_path}")

    def load_role_profiles(self) -> Dict[str, str]:
        """
        Load all role profile files from the roles directory.
        In test mode, only loads 3 shortest profiles.

        Returns:
            Dictionary mapping role filename (without .typ) to file content
        """
        if not self.roles_path.exists():
            raise FileNotFoundError(f"Roles folder not found: {self.roles_path}")

        profiles = {}

        # Find all .typ files in roles directory
        for typ_file in self.roles_path.glob("*.typ"):
            role_name = typ_file.stem  # filename without extension

            # Read file content as plain text
            with open(typ_file, 'r', encoding='utf-8') as f:
                content = f.read()

            profiles[role_name] = content

        # If test mode, only keep 3 shortest profiles
        if self.test_mode:
            # Sort by content length and take 3 shortest
            sorted_profiles = sorted(profiles.items(), key=lambda x: len(x[1]))
            profiles = dict(sorted_profiles[:3])
            print(f"[TEST MODE] Using only 3 shortest role profiles: {', '.join(profiles.keys())}")

        return profiles

    def load_taxonomy(self) -> str:
        """
        Load the financial institutions taxonomy file.

        Returns:
            Content of the taxonomy file
        """
        if not self.taxonomy_path.exists():
            raise FileNotFoundError(f"Taxonomy file not found: {self.taxonomy_path}")

        with open(self.taxonomy_path, 'r', encoding='utf-8') as f:
            return f.read()

    def build_cached_context(self) -> str:
        """
        Build the complete reference context for prompt caching.
        Combines all role profiles and taxonomy into one string.

        Returns:
            Combined reference materials as formatted string
        """
        context_parts = []

        # Add taxonomy first
        context_parts.append("# FINANCIAL INSTITUTIONS TAXONOMY\n")
        context_parts.append(self.load_taxonomy())
        context_parts.append("\n\n")

        # Add all role profiles
        context_parts.append("# ROLE PROFILES\n\n")
        profiles = self.load_role_profiles()

        for role_name, content in sorted(profiles.items()):
            context_parts.append(f"## {role_name.replace('_', ' ').title()}\n\n")
            context_parts.append(content)
            context_parts.append("\n\n---\n\n")

        return "".join(context_parts)


if __name__ == "__main__":
    # Simple test
    print("Testing ContentLoader...\n")

    loader = ContentLoader()

    # Test 1: Load role profiles
    print("Loading role profiles...")
    profiles = loader.load_role_profiles()
    print(f"✓ Loaded {len(profiles)} role profiles")
    print(f"  Roles: {', '.join(sorted(profiles.keys())[:5])}...\n")

    # Test 2: Load taxonomy
    print("Loading taxonomy...")
    taxonomy = loader.load_taxonomy()
    print(f"✓ Loaded taxonomy ({len(taxonomy)} characters)\n")

    # Test 3: Show sample content from one role
    print("Sample content from 'trader_sales_and_trading':")
    if 'trader_sales_and_trading' in profiles:
        sample = profiles['trader_sales_and_trading'][:500]
        print(sample)
        print(f"... (total {len(profiles['trader_sales_and_trading'])} characters)\n")

    # Test 4: Build cached context
    print("Building cached context...")
    cached_context = loader.build_cached_context()
    print(f"✓ Built cached context ({len(cached_context)} characters)")
    print(f"  This will be sent to Claude with prompt caching")

"""
Content loader for reference materials (role profiles and taxonomy).
Version 1: Simple file loading without parsing.
"""

import os
from pathlib import Path
from typing import Dict


class ContentLoader:
    """Loads reference materials from .typ files."""

    def __init__(self, reference_path: str = None, test_mode: bool = False, use_summaries: bool = True):
        """
        Initialize the content loader.

        Args:
            reference_path: Path to reference folder. If None, uses default.
            test_mode: If True, only load 3 shortest role profiles (for testing)
            use_summaries: If True, load summary versions of roles instead of full profiles
        """
        if reference_path is None:
            # Default: reference folder in project root
            project_root = Path(__file__).parent.parent
            reference_path = project_root / "reference"

        self.reference_path = Path(reference_path)
        self.roles_path = self.reference_path / "roles"
        self.summaries_path = self.reference_path / "roles_summary"
        self.taxonomy_path = self.reference_path / "Financial_insto_taxonomy.typ"
        self.test_mode = test_mode
        self.use_summaries = use_summaries

        # Cache for loaded profiles to avoid re-reading files
        self._profiles_cache = None

        # Validate paths exist
        if not self.reference_path.exists():
            raise FileNotFoundError(f"Reference folder not found: {self.reference_path}")

    def load_role_profiles(self) -> Dict[str, str]:
        """
        Load all role profile files from the roles directory.
        In test mode, only loads 3 shortest profiles.
        If use_summaries=True, loads from roles_summary folder.
        Results are cached to avoid re-reading files.

        Returns:
            Dictionary mapping role filename (without .typ) to file content
        """
        # Return cached profiles if already loaded
        if self._profiles_cache is not None:
            return self._profiles_cache

        # Choose source directory based on use_summaries setting
        if self.use_summaries:
            source_path = self.summaries_path
            if not source_path.exists():
                print(f"[WARNING] Summaries folder not found: {source_path}")
                print(f"[WARNING] Falling back to full role profiles")
                source_path = self.roles_path
        else:
            source_path = self.roles_path

        if not source_path.exists():
            raise FileNotFoundError(f"Roles folder not found: {source_path}")

        profiles = {}

        # Find all .typ files in source directory
        for typ_file in source_path.glob("*.typ"):
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
            mode_str = "summaries" if self.use_summaries else "full profiles"
            print(f"[TEST MODE] Using only 3 shortest role {mode_str}: {', '.join(profiles.keys())}")
        elif self.use_summaries:
            print(f"[SUMMARY MODE] Loaded {len(profiles)} role summaries")

        # Cache the result
        self._profiles_cache = profiles
        return profiles

    def load_full_role_profile(self, role_name: str) -> str:
        """
        Load the full version of a specific role profile.
        Used when summaries are loaded initially but full detail is needed.

        Args:
            role_name: Name of the role (without .typ extension)

        Returns:
            Full content of the role profile

        Raises:
            FileNotFoundError: If the role profile doesn't exist
        """
        role_file = self.roles_path / f"{role_name}.typ"

        if not role_file.exists():
            raise FileNotFoundError(f"Role profile not found: {role_name}")

        with open(role_file, 'r', encoding='utf-8') as f:
            return f.read()

    def get_available_roles(self) -> list[str]:
        """
        Get list of all available role names.

        Returns:
            List of role names (without .typ extension)
        """
        if not self.roles_path.exists():
            return []

        return [f.stem for f in self.roles_path.glob("*.typ")]

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

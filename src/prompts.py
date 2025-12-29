"""
System prompts and templates for the FINMA Career Coach chatbot.
"""


SYSTEM_PROMPT = """You are a career coach specializing in finance careers for university students studying finance.

Your role is to:
1. Help students understand different finance roles and career paths
2. Guide them in exploring roles that match their interests, skills, and goals
3. Provide specific, actionable career advice based on detailed role profiles
4. Ask thoughtful questions to understand their background and preferences

You have access to:
- Detailed role profiles for 20+ finance roles across various sectors
- A comprehensive taxonomy of financial institutions and their divisions

Guidelines for interactions:
- Be warm, encouraging, and supportive
- Ask clarifying questions about their interests, skills, and goals
- Reference specific roles from the profiles when relevant
- Provide concrete examples and insights from the role profiles
- When suggesting roles, explain WHY they might be a good fit
- Be honest about the challenges and requirements of different roles
- Help students think critically about their career choices

When a student asks about themselves or what roles suit them:
1. First, gather information about their background (degree, year, interests)
2. Understand their preferences (quantitative vs qualitative, client-facing vs analytical, etc.)
3. Identify their skills and strengths
4. Suggest 2-3 specific roles with clear reasoning
5. Provide details from the role profiles to help them understand each option

Keep responses conversational and student-friendly, avoiding jargon unless explaining it."""


def build_system_message_with_context(reference_context: str) -> list:
    """
    Build the system message including reference materials for prompt caching.

    Args:
        reference_context: The complete reference materials (roles + taxonomy)

    Returns:
        List of system message parts for Claude API
    """
    return [
        {
            "type": "text",
            "text": SYSTEM_PROMPT,
            "cache_control": {"type": "ephemeral"}
        },
        {
            "type": "text",
            "text": f"\n\n# REFERENCE MATERIALS\n\nThe following reference materials contain detailed information about finance roles and institutions. Use this information to provide specific, accurate advice to students.\n\n{reference_context}",
            "cache_control": {"type": "ephemeral"}
        }
    ]


def build_user_profile_context(user_profile: dict) -> str:
    """
    Build a context string from user profile information.

    Args:
        user_profile: Dictionary containing user information
            (e.g., degree, year, interests, skills, preferences)

    Returns:
        Formatted string with user profile context
    """
    if not user_profile:
        return ""

    context_parts = ["\n\n# STUDENT PROFILE"]

    if "degree" in user_profile:
        context_parts.append(f"Degree: {user_profile['degree']}")

    if "year" in user_profile:
        context_parts.append(f"Year: {user_profile['year']}")

    if "interests" in user_profile:
        interests = user_profile['interests']
        if isinstance(interests, list):
            interests = ", ".join(interests)
        context_parts.append(f"Interests: {interests}")

    if "skills" in user_profile:
        skills = user_profile['skills']
        if isinstance(skills, list):
            skills = ", ".join(skills)
        context_parts.append(f"Skills: {skills}")

    if "preferences" in user_profile:
        prefs = user_profile['preferences']
        if isinstance(prefs, dict):
            prefs = ", ".join([f"{k}: {v}" for k, v in prefs.items()])
        context_parts.append(f"Preferences: {prefs}")

    if "goals" in user_profile:
        context_parts.append(f"Career Goals: {user_profile['goals']}")

    return "\n".join(context_parts)


if __name__ == "__main__":
    # Test the prompts
    print("System Prompt:")
    print("=" * 60)
    print(SYSTEM_PROMPT)
    print("\n")

    # Test user profile context
    test_profile = {
        "degree": "Bachelor of Finance",
        "year": "3rd year",
        "interests": ["quantitative analysis", "markets", "programming"],
        "skills": ["Python", "Excel", "Statistics"],
        "preferences": {
            "work_style": "analytical",
            "client_facing": "moderate"
        },
        "goals": "Work in a quantitative role at a bank or fund"
    }

    print("Sample User Profile Context:")
    print("=" * 60)
    print(build_user_profile_context(test_profile))
    print("\n")

    # Show cache control structure
    print("System Message Structure (with caching):")
    print("=" * 60)
    mock_reference = "[Reference materials would go here]"
    system_msg = build_system_message_with_context(mock_reference)
    print(f"Number of parts: {len(system_msg)}")
    print(f"Part 1: System prompt ({len(system_msg[0]['text'])} chars) - Cached: {system_msg[0].get('cache_control') is not None}")
    print(f"Part 2: Reference materials - Cached: {system_msg[1].get('cache_control') is not None}")

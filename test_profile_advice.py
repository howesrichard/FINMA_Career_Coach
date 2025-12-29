"""
Test career advice with student profile.
"""

from src.claude_client import ClaudeCareerCoach

print("=" * 60)
print("Test: Career Advice with Student Profile")
print("=" * 60)
print()

# Initialize with caching
print("Initializing coach...")
coach = ClaudeCareerCoach(use_caching=True)
print("✓ Ready!\n")

# Student profile
student_profile = {
    "degree": "Bachelor of Finance",
    "year": "3rd year",
    "interests": ["markets", "quantitative analysis"],
    "skills": ["Python", "Excel"]
}

print("Student Profile:")
print(f"  Degree: {student_profile['degree']}")
print(f"  Year: {student_profile['year']}")
print(f"  Interests: {', '.join(student_profile['interests'])}")
print(f"  Skills: {', '.join(student_profile['skills'])}")
print()

print("Question: What roles might suit me?")
print("-" * 60)

try:
    response = coach.chat(
        "What roles might suit me? Please suggest 2-3 roles and explain why.",
        user_profile=student_profile
    )

    print(f"\nCoach Response:\n{response}\n")
    print("=" * 60)
    print("✓ Test successful!")

except Exception as e:
    print(f"\n❌ Error: {e}")
    print(f"\nError type: {type(e).__name__}")

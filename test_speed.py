"""
Test the speed of the coach directly (without Streamlit)
"""

import time
from src.claude_client import ClaudeCareerCoach

print("Initializing coach in TEST mode...")
start = time.time()
coach = ClaudeCareerCoach(use_caching=True, test_mode=True)
init_time = time.time() - start
print(f"✓ Initialization took: {init_time:.2f} seconds\n")

print("Asking question: 'Tell me about trading'")
start = time.time()
response = coach.chat("Tell me about trading")
response_time = time.time() - start

print(f"\n✓ Response received in: {response_time:.2f} seconds")
print(f"\nResponse preview (first 200 chars):")
print(response[:200] + "...")

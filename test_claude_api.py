import os
from anthropic import Anthropic

# Initialize the Anthropic client
client = Anthropic(api_key=os.environ.get("ANTHROPIC_API_KEY"))

print("Client initialized successfully!")

# Send a message to Claude
message = client.messages.create(
    model="claude-sonnet-4-5-20250929",
    max_tokens=1024,
    messages=[
        {"role": "user", "content": "Hello, Claude! Can you explain what you do in one sentence?"}
    ]
)

# Print the response
print("\nClaude's response:")
print(message.content[0].text)

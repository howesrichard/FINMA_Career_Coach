import streamlit as st
import anthropic
import os
from dotenv import load_dotenv

# Load environment variables
load_dotenv()

# Page configuration
st.set_page_config(
    page_title="FINMA Career Coach",
    page_icon="💼",
    layout="wide"
)

# Title
st.title("💼 FINMA Career Coach")
st.subheader("Chat with Claude AI for Career Guidance")

# Initialize session state for messages
if "messages" not in st.session_state:
    st.session_state.messages = []

# Sidebar for API key
with st.sidebar:
    st.header("Configuration")
    api_key = st.text_input(
        "Anthropic API Key",
        type="password",
        value=os.getenv("ANTHROPIC_API_KEY", ""),
        help="Enter your Anthropic API key"
    )
    
    if not api_key:
        st.warning("Please enter your Anthropic API key to start chatting.")
    
    st.divider()
    st.info("This app uses Claude AI to provide career coaching and guidance.")

# Display chat messages
for message in st.session_state.messages:
    with st.chat_message(message["role"]):
        st.markdown(message["content"])

# Chat input
if prompt := st.chat_input("Ask me anything about your career..."):
    if not api_key:
        st.error("Please enter your Anthropic API key in the sidebar.")
    else:
        # Add user message to chat
        st.session_state.messages.append({"role": "user", "content": prompt})
        with st.chat_message("user"):
            st.markdown(prompt)
        
        # Get Claude's response
        with st.chat_message("assistant"):
            message_placeholder = st.empty()
            full_response = ""
            
            try:
                client = anthropic.Anthropic(api_key=api_key)
                
                # Create the message with streaming
                with client.messages.stream(
                    model="claude-3-5-sonnet-20241022",
                    max_tokens=1024,
                    messages=[
                        {"role": m["role"], "content": m["content"]}
                        for m in st.session_state.messages
                    ],
                    system="You are a helpful career coach assisting FINMA participants with career guidance, planning, and advice. Be supportive, insightful, and professional.",
                ) as stream:
                    for text in stream.text_stream:
                        full_response += text
                        message_placeholder.markdown(full_response + "▌")
                
                message_placeholder.markdown(full_response)
                
            except Exception as e:
                st.error(f"Error communicating with Claude: {str(e)}")
                full_response = f"I apologize, but I encountered an error: {str(e)}"
                message_placeholder.markdown(full_response)
        
        # Add assistant response to chat history
        st.session_state.messages.append({"role": "assistant", "content": full_response})

# Footer
st.divider()
st.caption("FINMA Career Coach - Powered by Claude AI")

"""
FINMA Career Coach - Streamlit Web Application
A career coaching chatbot for finance students.
"""

import streamlit as st
from src.claude_client import ClaudeCareerCoach

# Page configuration
st.set_page_config(
    page_title="FINMA Career Coach",
    page_icon="💼",
    layout="wide",
    initial_sidebar_state="expanded"
)

# Custom CSS for better styling
st.markdown("""
    <style>
    .main-header {
        font-size: 2.5rem;
        font-weight: bold;
        color: #1f77b4;
        margin-bottom: 0.5rem;
    }
    .sub-header {
        font-size: 1.2rem;
        color: #666;
        margin-bottom: 2rem;
    }
    </style>
""", unsafe_allow_html=True)


def initialize_coach():
    """Initialize the career coach (cached across reruns)."""
    if 'coach' not in st.session_state:
        with st.spinner("Loading career coach and reference materials..."):
            # Use test_mode from sidebar setting (default to True for safety)
            test_mode = st.session_state.get('test_mode', True)
            st.session_state.coach = ClaudeCareerCoach(
                use_caching=True,
                test_mode=test_mode
            )
    return st.session_state.coach


def initialize_session_state():
    """Initialize session state variables."""
    if 'messages' not in st.session_state:
        st.session_state.messages = []

    if 'user_profile' not in st.session_state:
        st.session_state.user_profile = {}


def main():
    """Main application."""

    # Initialize session state
    initialize_session_state()

    # Sidebar
    with st.sidebar:
        st.markdown("### ⚙️ Settings")

        # Test mode toggle
        test_mode = st.checkbox(
            "Test Mode (3 roles only)",
            value=st.session_state.get('test_mode', True),  # Default to True for safety
            help="Use only 3 role profiles for cheaper testing. Uncheck for full 20 roles (more expensive)."
        )

        # Warning when test mode is disabled
        if not test_mode:
            st.warning("⚠️ Full mode uses ~168k tokens per request. Significantly more expensive!")

        # If test mode changed, update and reinitialize
        if test_mode != st.session_state.get('test_mode', True):
            st.session_state.test_mode = test_mode
            if 'coach' in st.session_state:
                del st.session_state.coach  # Force reinitialization
            st.rerun()

        st.markdown("---")

        # User profile section
        st.markdown("### 👤 Your Profile")
        st.markdown("*Optional: Help the coach understand you better*")

        degree = st.text_input("Degree", placeholder="e.g., Bachelor of Finance")
        year = st.text_input("Year", placeholder="e.g., 3rd year")
        interests = st.text_area(
            "Interests",
            placeholder="e.g., markets, quantitative analysis, programming",
            help="Separate with commas"
        )
        skills = st.text_area(
            "Skills",
            placeholder="e.g., Python, Excel, Statistics",
            help="Separate with commas"
        )

        # Update profile in session state
        st.session_state.user_profile = {
            "degree": degree if degree else None,
            "year": year if year else None,
            "interests": [i.strip() for i in interests.split(",")] if interests else None,
            "skills": [s.strip() for s in skills.split(",")] if skills else None,
        }
        # Remove None values
        st.session_state.user_profile = {
            k: v for k, v in st.session_state.user_profile.items() if v
        }

        st.markdown("---")

        # Clear chat button
        if st.button("🗑️ Clear Chat History"):
            st.session_state.messages = []
            st.rerun()

        st.markdown("---")
        st.markdown("### ℹ️ About")
        st.markdown("""
        FINMA Career Coach helps finance students explore career paths
        using detailed role profiles and industry knowledge.

        **Tips:**
        - Ask about specific roles
        - Request career recommendations
        - Compare different paths
        - Learn about day-to-day work
        """)

    # Main content
    st.markdown('<div class="main-header">💼 FINMA Career Coach</div>', unsafe_allow_html=True)
    st.markdown('<div class="sub-header">Your AI guide to finance careers</div>', unsafe_allow_html=True)

    # Initialize coach (will use cached instance if available)
    coach = initialize_coach()

    # Display chat messages
    for message in st.session_state.messages:
        with st.chat_message(message["role"]):
            st.markdown(message["content"])

    # Chat input
    if prompt := st.chat_input("Ask me about finance careers..."):
        # Add user message to chat
        st.session_state.messages.append({"role": "user", "content": prompt})

        # Display user message
        with st.chat_message("user"):
            st.markdown(prompt)

        # Get coach response
        with st.chat_message("assistant"):
            with st.spinner("Thinking..."):
                # Build conversation history for Claude
                conversation_history = []
                for msg in st.session_state.messages[:-1]:  # Exclude the current message
                    conversation_history.append({
                        "role": msg["role"],
                        "content": msg["content"]
                    })

                # Get response from coach
                response = coach.chat(
                    user_message=prompt,
                    conversation_history=conversation_history,
                    user_profile=st.session_state.user_profile
                )

                # Display response
                st.markdown(response)

        # Add assistant response to chat history
        st.session_state.messages.append({"role": "assistant", "content": response})


if __name__ == "__main__":
    main()

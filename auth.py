"""
Simple password authentication for Streamlit app.
"""
import streamlit as st
import hashlib


def check_password():
    """Returns `True` if the user has entered the correct password."""

    def password_entered():
        """Checks whether a password entered by the user is correct."""
        # Hash the entered password
        entered_hash = hashlib.sha256(
            st.session_state["password"].encode()
        ).hexdigest()

        # Compare with stored hash
        if entered_hash == st.secrets["password_hash"]:
            st.session_state["password_correct"] = True
            del st.session_state["password"]  # Don't store password
        else:
            st.session_state["password_correct"] = False

    # Return True if password is already correct
    if st.session_state.get("password_correct", False):
        return True

    # Show password input
    st.text_input(
        "Password",
        type="password",
        on_change=password_entered,
        key="password"
    )

    if "password_correct" in st.session_state:
        st.error("😕 Password incorrect")

    return False


if __name__ == "__main__":
    # Generate password hash for setup
    import sys
    if len(sys.argv) > 1:
        password = sys.argv[1]
        hash_value = hashlib.sha256(password.encode()).hexdigest()
        print(f"Password hash for '{password}':")
        print(hash_value)
        print("\nAdd this to your Streamlit secrets:")
        print(f'password_hash = "{hash_value}"')

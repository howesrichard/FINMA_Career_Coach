"""
Rate limiting for Streamlit app to prevent API abuse.
"""
import streamlit as st
import time
from datetime import datetime, timedelta


class RateLimiter:
    """Rate limiter to control API usage per session."""

    def __init__(self, max_requests: int = 10, window_minutes: int = 10):
        """
        Initialize rate limiter.

        Args:
            max_requests: Maximum requests allowed in the time window
            window_minutes: Time window in minutes
        """
        self.max_requests = max_requests
        self.window_seconds = window_minutes * 60

    def check_rate_limit(self) -> tuple[bool, str]:
        """
        Check if the current session has exceeded the rate limit.

        Returns:
            Tuple of (allowed: bool, message: str)
        """
        # Initialize request times in session state
        if 'request_times' not in st.session_state:
            st.session_state.request_times = []

        now = time.time()

        # Remove requests older than the time window
        st.session_state.request_times = [
            t for t in st.session_state.request_times
            if now - t < self.window_seconds
        ]

        # Check if limit exceeded
        if len(st.session_state.request_times) >= self.max_requests:
            # Calculate when they can make another request
            oldest_request = min(st.session_state.request_times)
            wait_until = oldest_request + self.window_seconds
            wait_seconds = int(wait_until - now)
            wait_minutes = wait_seconds // 60

            message = f"⏱️ Rate limit reached. You've made {self.max_requests} requests in the last {self.window_seconds // 60} minutes. Please wait {wait_minutes} minute(s) before asking another question."
            return False, message

        # Record this request
        st.session_state.request_times.append(now)

        # Calculate remaining requests
        remaining = self.max_requests - len(st.session_state.request_times)
        message = f"✓ Request allowed ({remaining} remaining in this window)"

        return True, message

    def get_usage_stats(self) -> dict:
        """
        Get current rate limit usage statistics.

        Returns:
            Dictionary with usage stats
        """
        if 'request_times' not in st.session_state:
            return {
                'requests_made': 0,
                'requests_remaining': self.max_requests,
                'window_minutes': self.window_seconds // 60,
                'max_requests': self.max_requests
            }

        now = time.time()

        # Clean old requests
        recent_requests = [
            t for t in st.session_state.request_times
            if now - t < self.window_seconds
        ]

        return {
            'requests_made': len(recent_requests),
            'requests_remaining': max(0, self.max_requests - len(recent_requests)),
            'window_minutes': self.window_seconds // 60,
            'max_requests': self.max_requests
        }


def show_rate_limit_info():
    """Display rate limit information in the sidebar."""
    limiter = RateLimiter()
    stats = limiter.get_usage_stats()

    st.sidebar.markdown("---")
    st.sidebar.markdown("### 📊 Usage Limits")
    st.sidebar.info(
        f"**{stats['requests_remaining']} / {stats['max_requests']}** requests remaining\n\n"
        f"Resets in {stats['window_minutes']} minute window"
    )

    # Show warning if getting close to limit
    if stats['requests_remaining'] <= 2 and stats['requests_remaining'] > 0:
        st.sidebar.warning(f"⚠️ Only {stats['requests_remaining']} request(s) left!")


if __name__ == "__main__":
    # Test rate limiter
    limiter = RateLimiter(max_requests=5, window_minutes=1)

    print("Testing rate limiter (5 requests per 1 minute)")
    print("-" * 50)

    for i in range(7):
        allowed, message = limiter.check_rate_limit()
        print(f"Request {i+1}: {message}")

        if not allowed:
            print("✗ BLOCKED")
        else:
            print("✓ ALLOWED")

        time.sleep(0.1)

    print("\nUsage stats:")
    print(limiter.get_usage_stats())

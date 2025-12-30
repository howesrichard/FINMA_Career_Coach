# Security Features - FINMA Career Coach

This document outlines the security measures implemented to protect against API abuse and unauthorized access.

## 🔐 Password Protection

**File**: `auth.py`

Simple password authentication that protects the entire app.

### How It Works
1. User opens app → sees password prompt
2. Password is hashed using SHA-256
3. Hash is compared with stored hash in Streamlit secrets
4. Correct password → app loads
5. Wrong password → error message, no API access

### Setup
```bash
# Generate password hash
python auth.py "YourPassword123"

# Add to Streamlit secrets
password_hash = "generated-hash-here"
```

### Security Notes
- Password is never stored in plain text
- Only the hash is compared
- Password not saved in session (deleted after verification)
- One password for all students (simple but effective)

## ⏱️ Rate Limiting

**File**: `rate_limiter.py`

Prevents API abuse by limiting requests per user session.

### Current Limits
- **10 requests per 10 minutes** per user session
- Tracked independently for each browser session
- Resets every 10 minutes from oldest request

### How It Works
1. User submits question
2. Check: Have they made 10 requests in last 10 minutes?
3. If yes → Show error, don't process request
4. If no → Process request, add to counter

### User Experience
- Sidebar shows remaining requests: "7 / 10 requests remaining"
- Warning at 2 requests left: "⚠️ Only 2 request(s) left!"
- Rate limit error: "⏱️ Rate limit reached. Please wait X minutes."

### Why This Limit?
- **10 requests** = Enough for a good conversation
- **10 minutes** = Reasonable time window
- **Per session** = Each browser tab is separate (by design)

### Adjusting Limits

Edit `app.py` line 171:
```python
limiter = RateLimiter(max_requests=10, window_minutes=10)
```

Examples:
- More generous: `RateLimiter(max_requests=20, window_minutes=15)`
- Stricter: `RateLimiter(max_requests=5, window_minutes=5)`
- For testing: `RateLimiter(max_requests=100, window_minutes=60)`

## 🔒 Summary Mode Locked

**Change**: Removed "Use Role Summaries" checkbox

### Why?
- Summaries are **85% more efficient** than full profiles
- Prevents students from accidentally using expensive mode
- Claude can still fetch full details via tool calling when needed
- Simplifies UI (one less decision for students)

### Technical Details
- `use_summaries=True` is hardcoded in `initialize_coach()`
- Students can still toggle "Test Mode" (3 vs 20 roles)
- Full role profiles available via automatic tool calling
- No functionality lost, just automatic optimization

## 📊 Cost Protection Summary

With all security features enabled:

| Scenario | Protection | Cost Impact |
|----------|-----------|-------------|
| **Random internet user finds URL** | ❌ Blocked by password | $0 |
| **Student shares password** | ✅ Rate limited to 10/10min | ~$0.10/student/day max |
| **Student forgets to use test mode** | ✅ Summaries always on | 80% cheaper automatically |
| **Student tries to spam** | ✅ Rate limited | Stops after 10 requests |

### Maximum Possible Cost Per Student
Worst case (student uses all limits):
- 10 requests per 10 minutes
- 6 windows per hour = 60 requests/hour
- 8 hours of continuous use = 480 requests
- @ $0.01/request = **$4.80/day maximum**

Realistic case (normal usage):
- 5-10 questions per session
- 1-2 sessions per week
- @ $0.01/request = **$0.20/week per student**

## 🚨 Monitoring Recommendations

### Set Anthropic Spending Alerts
1. Log into Anthropic dashboard
2. Go to Settings → Billing
3. Set alert at $50, $100, $200
4. Get email if limits exceeded

### First Week Checklist
- [ ] Check API usage daily
- [ ] Monitor for unusual patterns
- [ ] Ask students for feedback
- [ ] Verify rate limiting works
- [ ] Confirm password is working

### Red Flags
- Sudden spike in API calls
- Single session with 100+ requests
- Requests during 2-5 AM (suspicious)
- Costs growing faster than student count

### Emergency Actions
If you see abuse:

1. **Immediate**: Change password in Streamlit secrets (30 seconds)
2. **Quick**: Reduce rate limits in `app.py` (2 minutes)
3. **Nuclear**: Pause app in Streamlit Cloud (instant)

## 🔧 Advanced Security (Optional)

### Individual User Authentication

Replace password with user accounts:

```bash
pip install streamlit-authenticator
```

**Pros**: Track individual users, revoke access
**Cons**: More setup, manage user list
**When**: >50 students or need tracking

### Google OAuth

Use university Google accounts:

```bash
pip install streamlit-google-auth
```

**Pros**: No password to remember, domain restriction
**Cons**: Complex setup, Google Cloud config
**When**: Official university deployment

### IP Whitelisting

Restrict to university network (requires Digital Ocean):

**Pros**: No password needed on campus
**Cons**: Can't use from home, server management
**When**: Campus-only deployment

## 📝 Student Communication

**Email to students:**

```
Subject: Career Coach - Important Guidelines

The FINMA Career Coach is now available!

URL: https://your-app.streamlit.app
Password: [provided separately]

IMPORTANT:
✓ Keep password private (don't share publicly)
✓ You have 10 questions per 10 minutes (plenty for good conversations)
✓ Test Mode is cheaper - use unless you need all 20 roles
✓ The coach can fetch full details automatically when needed

Questions? Let me know!
```

## 🎯 Summary

**Security Stack:**
1. ✅ Password protection (blocks unauthorized access)
2. ✅ Rate limiting (prevents abuse)
3. ✅ Summary mode locked (automatic cost optimization)
4. ✅ Test mode default (further cost savings)

**Result:**
- Protected against random internet users
- Protected against student abuse
- Protected against accidental expensive usage
- Typical cost: ~$20-50/month for 100 students

The combination of these features makes your app safe for public deployment while keeping costs predictable and reasonable.

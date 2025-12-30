# Streamlit Cloud Deployment Guide

Quick guide to deploy FINMA Career Coach to Streamlit Cloud with password protection.

## Quick Deploy (5 minutes)

### Step 1: Generate Password Hash

Run this locally to generate a password hash:

```bash
python auth.py "YourSecurePassword123"
```

This will output something like:
```
Password hash for 'YourSecurePassword123':
5e884898da28047151d0e56f8dc6292773603d0d6aabbdd62a11ef721d1542d8

Add this to your Streamlit secrets:
password_hash = "5e884898da28047151d0e56f8dc6292773603d0d6aabbdd62a11ef721d1542d8"
```

**Save this hash** - you'll need it in Step 4.

### Step 2: Push to GitHub

```bash
# If you haven't initialized git yet
git init
git add .
git commit -m "Initial commit - FINMA Career Coach"

# Create a new repository on GitHub, then:
git remote add origin https://github.com/yourusername/FINMA_Career_Coach.git
git branch -M main
git push -u origin main
```

### Step 3: Deploy to Streamlit Cloud

1. Go to [share.streamlit.io](https://share.streamlit.io)
2. Sign in with GitHub
3. Click **New app**
4. Select:
   - **Repository**: Your FINMA_Career_Coach repo
   - **Branch**: main
   - **Main file path**: app.py
5. Click **Deploy** (don't worry, it will fail initially - we need to add secrets)

### Step 4: Configure Secrets

Before the app works, you need to add your API key and password:

1. In Streamlit Cloud, click on your app
2. Click **Settings** (⚙️) → **Secrets**
3. Add this (replace with your actual values):

```toml
# Anthropic API Key
ANTHROPIC_API_KEY = "sk-ant-api03-your-actual-key-here"

# Password hash (from Step 1)
password_hash = "5e884898da28047151d0e56f8dc6292773603d0d6aabbdd62a11ef721d1542d8"
```

4. Click **Save**
5. App will automatically restart with secrets loaded

### Step 5: Test Your App

1. Open your app URL: `https://your-app.streamlit.app`
2. You'll see a password prompt
3. Enter your password (the one you used to generate the hash)
4. If correct, you'll see the career coach interface!

**Give the password only to your students.**

## Security Options Comparison

### Option 1: Password Protection (What We Implemented)

**Pros:**
- ✅ Simple to implement
- ✅ One password for all students
- ✅ Easy to share with class
- ✅ No cost

**Cons:**
- ❌ Students might share password publicly
- ❌ Can't revoke individual access
- ❌ No usage tracking per student

**Best for:** Small classes (<50 students), trusted environment

### Option 2: Streamlit Authentication (More Robust)

Use a library like `streamlit-authenticator`:

```bash
pip install streamlit-authenticator
```

**Pros:**
- ✅ Individual usernames/passwords
- ✅ Can revoke specific users
- ✅ Password hashing built-in
- ✅ Track who's using it

**Cons:**
- ❌ More complex setup
- ❌ Need to manage user list

**Best for:** Larger classes, need user tracking

### Option 3: Google OAuth (Most Professional)

Use `streamlit-google-auth`:

**Pros:**
- ✅ Students use university Google accounts
- ✅ No password to remember
- ✅ Can restrict to your university domain
- ✅ Professional authentication

**Cons:**
- ❌ Requires Google Cloud setup
- ❌ More complex configuration
- ❌ Need verified domain

**Best for:** Official university deployment

### Option 4: Private Streamlit Cloud App

**Streamlit Cloud paid tier** ($20/month):
- ✅ App not publicly accessible
- ✅ Share only with specific email addresses
- ✅ No coding required
- ❌ Costs money

### Option 5: IP Whitelisting (Digital Ocean)

If you deploy to Digital Ocean instead:
- ✅ Restrict to university network IPs
- ✅ No password needed on campus
- ❌ Requires server management
- ❌ Students can't access from home (unless VPN)

## Monitoring API Costs

Even with password protection, monitor your Anthropic API usage:

1. **Set spending limits** in Anthropic dashboard
2. **Check usage daily** (especially first week)
3. **Alert students** about test mode vs production mode
4. **Consider rate limiting** (advanced)

### Simple Rate Limiting

Add to your app to limit requests per user:

```python
import time

def check_rate_limit():
    """Allow max 10 requests per 10 minutes per session."""
    if 'request_times' not in st.session_state:
        st.session_state.request_times = []

    now = time.time()
    # Remove requests older than 10 minutes
    st.session_state.request_times = [
        t for t in st.session_state.request_times
        if now - t < 600
    ]

    if len(st.session_state.request_times) >= 10:
        st.error("⏱️ Rate limit exceeded. Please wait 10 minutes.")
        return False

    st.session_state.request_times.append(now)
    return True
```

## Recommended Setup for University Use

**Start with:**
1. ✅ Password protection (simple, works immediately)
2. ✅ Test mode enabled by default (saves money)
3. ✅ Rate limiting (10 requests per 10 min)
4. ✅ Spending alert in Anthropic dashboard

**After testing (if needed):**
1. Upgrade to individual authentication
2. Add Google OAuth for university emails
3. Move to paid Streamlit tier if needed

## Sharing with Students

**Email template:**

```
Subject: FINMA Career Coach - Access Instructions

Hi everyone,

I've set up a career coaching AI tool for our class:
URL: https://your-app.streamlit.app

Password: [YourPassword]

Please:
- Don't share the password outside our class
- Use "Test Mode" for general questions (cheaper)
- Only uncheck "Test Mode" when you need all 20 roles
- Be respectful of API costs

The coach can help you:
- Explore finance career paths
- Understand role requirements
- Compare different positions
- Get advice based on your interests

Let me know if you have any issues!
```

## Updating Your App

When you make changes:

```bash
git add .
git commit -m "Your changes"
git push
```

Streamlit Cloud automatically redeploys (takes ~2 minutes).

## Troubleshooting

### "Password incorrect" always shows
- Check your password hash in Secrets matches what you generated
- Make sure no extra spaces in the secrets file
- Password is case-sensitive

### App crashes on load
- Check Streamlit Cloud logs (App → Logs)
- Verify `ANTHROPIC_API_KEY` is set in Secrets
- Ensure all files committed to GitHub

### Students can't access
- Share the full URL including `https://`
- Check password is correct
- Verify app is running (not sleeping)

### High API costs
- Ensure test mode is default
- Add rate limiting
- Check Anthropic dashboard for usage
- Consider disabling tool calling for testing

## Cost Estimates

**With password protection + test mode:**
- First month (testing): $5-10
- Normal usage (100 students, 500 queries/month): $20-50/month
- With all roles enabled: 5x higher

**Without protection:**
- Could be hundreds if someone finds it and abuses it

## Summary Checklist

- [ ] Generate password hash
- [ ] Push code to GitHub
- [ ] Deploy to Streamlit Cloud
- [ ] Add secrets (API key + password hash)
- [ ] Test password protection
- [ ] Set Anthropic spending limit
- [ ] Share with students
- [ ] Monitor usage first week

## Alternative: Deploy Multiple Versions

Smart approach:
- **Test version**: Public, test mode forced on
- **Production version**: Password protected, all roles

This way students can try it freely, but serious usage is controlled.

# Running the FINMA Career Coach App

## Quick Start

1. **Ensure your API key is set:**
   ```bash
   export ANTHROPIC_API_KEY="your-api-key-here"
   ```

2. **Run the Streamlit app:**
   ```bash
   streamlit run app.py
   ```

3. **Open your browser:**
   - The app will automatically open at `http://localhost:8501`
   - If not, navigate to the URL shown in the terminal

## Features

### Test Mode (Recommended for Development)
- Toggle "Test Mode" in the sidebar
- Uses only 3 role profiles (84% cheaper)
- Perfect for testing and development

### User Profile
- Fill in your profile in the sidebar (optional)
- Helps the coach give personalized recommendations
- Includes: degree, year, interests, skills

### Chat Interface
- Ask questions about finance roles
- Request career recommendations
- Compare different paths
- Learn about day-to-day work

## Example Questions

- "What does a trader do in Sales & Trading?"
- "What roles might suit me?" (with profile filled in)
- "Compare quant researcher vs credit analyst roles"
- "What skills do I need for derivatives hedging?"
- "Tell me about work-life balance in different roles"

## Tips

1. **Start with Test Mode** during development to save costs
2. **Fill in your profile** for personalized recommendations
3. **Use the chat history** - the coach remembers context
4. **Clear history** when starting a new topic

## Stopping the App

Press `Ctrl+C` in the terminal to stop the Streamlit server.

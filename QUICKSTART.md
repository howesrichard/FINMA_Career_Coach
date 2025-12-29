# Quick Start Guide

## Using the Devcontainer

### First Time Setup

1. **Install Prerequisites**:
   - Install [Docker Desktop](https://www.docker.com/products/docker-desktop)
   - Install [VS Code](https://code.visualstudio.com/)
   - Install the [Dev Containers extension](https://marketplace.visualstudio.com/items?itemName=ms-vscode-remote.remote-containers) in VS Code

2. **Open Project in Devcontainer**:
   - Open this folder in VS Code
   - Press `F1` or `Ctrl+Shift+P` (Windows/Linux) / `Cmd+Shift+P` (Mac)
   - Type "Dev Containers: Reopen in Container" and select it
   - Wait for the container to build (first time may take several minutes)

3. **Configure Your API Key**:
   ```bash
   cp .env.example .env
   # Edit .env and add your Anthropic API key
   ```

### Running the Streamlit App

```bash
streamlit run app.py
```

The app will automatically open at `http://localhost:8501`

### Running Jupyter Lab

```bash
jupyter lab --ip=0.0.0.0 --no-browser
```

Click the URL shown in the terminal to open Jupyter Lab.

## What's Included

### Python Environment
- Python 3.11
- Pre-installed development tools (pylint, black, autopep8, etc.)

### Key Packages
- **streamlit**: Web app framework
- **anthropic**: Claude AI API client
- **jupyter**: Interactive notebook environment
- **python-dotenv**: Environment variable management

### VS Code Extensions
- Python extension with Pylance
- Jupyter extension suite
- Integrated debugging and linting

### Port Forwarding
- Port 8501: Streamlit app (auto-forwarded)
- Port 8888: Jupyter Lab (when running)

## Troubleshooting

### Container Won't Build
- Ensure Docker Desktop is running
- Check Docker has enough resources (4GB+ RAM recommended)
- Try "Dev Containers: Rebuild Container" from the command palette

### Dependencies Not Installed
The devcontainer should automatically run `pip install --user -r requirements.txt` on first build. If packages are missing:

```bash
pip install --user -r requirements.txt
```

### API Key Not Working
- Verify your `.env` file exists and contains `ANTHROPIC_API_KEY=your_key`
- Check your API key is valid at https://console.anthropic.com/settings/keys
- Restart the Streamlit app after updating the `.env` file

## Next Steps

1. Explore `demo.ipynb` for examples of using the Anthropic API
2. Customize `app.py` to add more features
3. Read the main README.md for more detailed information

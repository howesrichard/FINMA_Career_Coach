# FINMA Career Coach 💼

A Streamlit-based web application that provides career coaching through Claude AI via the Anthropic API.

## Features

- 💬 **Interactive Chat Interface**: Chat with Claude AI for personalized career guidance
- 📊 **Streamlit Web App**: Modern, responsive web interface
- 📓 **Jupyter Notebook Support**: Experiment and prototype with notebooks
- 🐳 **Devcontainer Ready**: Pre-configured development environment

## Prerequisites

- [Docker](https://www.docker.com/) installed on your machine
- [Visual Studio Code](https://code.visualstudio.com/) with the [Dev Containers extension](https://marketplace.visualstudio.com/items?itemName=ms-vscode-remote.remote-containers)
- An [Anthropic API key](https://console.anthropic.com/settings/keys)

## Getting Started

### 1. Open in Devcontainer

1. Clone this repository
2. Open the repository in Visual Studio Code
3. When prompted, click "Reopen in Container" (or use the command palette: `Dev Containers: Reopen in Container`)
4. Wait for the devcontainer to build and install dependencies

### 2. Configure API Key

Create a `.env` file in the project root:

```bash
cp .env.example .env
```

Edit `.env` and add your Anthropic API key:

```
ANTHROPIC_API_KEY=your_actual_api_key_here
```

### 3. Run the Streamlit App

```bash
streamlit run app.py
```

The app will be available at `http://localhost:8501`

### 4. Explore with Jupyter

To launch Jupyter Lab:

```bash
jupyter lab --ip=0.0.0.0 --no-browser
```

Open `demo.ipynb` to see examples of interacting with the Claude API.

## Project Structure

```
.
├── .devcontainer/
│   └── devcontainer.json    # Devcontainer configuration
├── app.py                   # Main Streamlit application
├── demo.ipynb              # Jupyter notebook with examples
├── requirements.txt        # Python dependencies
├── .env.example           # Example environment variables
└── README.md             # This file
```

## Development

### Installing Additional Dependencies

```bash
pip install package-name
pip freeze > requirements.txt
```

### Running Tests

(Add test instructions when tests are implemented)

## Technology Stack

- **Python 3.11**: Programming language
- **Streamlit**: Web application framework
- **Anthropic API**: Claude AI integration
- **Jupyter**: Interactive notebook environment
- **Docker**: Containerized development environment

## License

(Add license information)

## Support

For issues and questions, please open an issue on GitHub.

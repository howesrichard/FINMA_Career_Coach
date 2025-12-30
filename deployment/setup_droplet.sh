#!/bin/bash
# Setup script for FINMA Career Coach on Digital Ocean droplet
# Run this on your fresh Ubuntu droplet

set -e  # Exit on any error

echo "========================================="
echo "FINMA Career Coach - Droplet Setup"
echo "========================================="

# Update system packages
echo ""
echo "📦 Updating system packages..."
sudo apt-get update
sudo apt-get upgrade -y

# Install Python 3.11
echo ""
echo "🐍 Installing Python 3.11..."
sudo apt-get install -y software-properties-common
sudo add-apt-repository -y ppa:deadsnakes/ppa
sudo apt-get update
sudo apt-get install -y python3.11 python3.11-venv python3.11-dev
sudo apt-get install -y python3-pip

# Install nginx
echo ""
echo "🌐 Installing Nginx..."
sudo apt-get install -y nginx

# Install git
echo ""
echo "📚 Installing Git..."
sudo apt-get install -y git

# Create application directory
echo ""
echo "📁 Creating application directory..."
sudo mkdir -p /var/www/finma-career-coach
sudo chown -R $USER:$USER /var/www/finma-career-coach

# Install system dependencies
echo ""
echo "🔧 Installing system dependencies..."
sudo apt-get install -y build-essential libssl-dev libffi-dev

echo ""
echo "✅ System setup complete!"
echo ""
echo "Next steps:"
echo "1. Clone your repository to /var/www/finma-career-coach"
echo "2. Set up environment variables"
echo "3. Install Python dependencies"
echo "4. Configure systemd service"
echo "5. Configure nginx"

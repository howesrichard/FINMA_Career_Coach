#!/bin/bash
# Deployment script - Run this after initial setup
# Updates the application with latest code changes

set -e

APP_DIR="/var/www/finma-career-coach"

echo "========================================="
echo "FINMA Career Coach - Deployment"
echo "========================================="

cd $APP_DIR

# Pull latest changes
echo ""
echo "📥 Pulling latest code..."
git pull origin main

# Activate virtual environment
echo ""
echo "🐍 Activating virtual environment..."
source venv/bin/activate

# Install/update dependencies
echo ""
echo "📦 Installing dependencies..."
pip install -r requirements.txt

# Restart the service
echo ""
echo "🔄 Restarting application..."
sudo systemctl restart finma-career-coach

# Check status
echo ""
echo "📊 Service status:"
sudo systemctl status finma-career-coach --no-pager

echo ""
echo "✅ Deployment complete!"
echo ""
echo "Access your app at: http://your-droplet-ip"

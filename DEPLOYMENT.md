# Deployment Guide - Digital Ocean Droplet

Complete guide to deploy FINMA Career Coach to a Digital Ocean droplet.

## Prerequisites

- Digital Ocean account
- SSH key configured in Digital Ocean
- Domain name (optional, but recommended)
- Anthropic API key

## Step 1: Create a Droplet

1. Log into Digital Ocean
2. Click **Create** → **Droplets**
3. Choose configuration:
   - **Image**: Ubuntu 22.04 LTS
   - **Plan**: Basic ($6/month works for testing, $12/month recommended for production)
   - **CPU**: Regular (Shared CPU)
   - **Datacenter**: Choose closest to your users
   - **Authentication**: SSH key (recommended) or password
   - **Hostname**: `finma-career-coach`
4. Click **Create Droplet**
5. Note your droplet's IP address (e.g., `142.93.xxx.xxx`)

## Step 2: Initial Server Setup

SSH into your droplet:

```bash
ssh root@your-droplet-ip
```

Run the setup script:

```bash
# Download and run setup script
curl -o setup.sh https://raw.githubusercontent.com/your-username/FINMA_Career_Coach/main/deployment/setup_droplet.sh
chmod +x setup.sh
./setup.sh
```

Or manually run each command from [deployment/setup_droplet.sh](deployment/setup_droplet.sh).

## Step 3: Clone Your Repository

```bash
# Navigate to app directory
cd /var/www/finma-career-coach

# Clone your repository (replace with your repo URL)
git clone https://github.com/your-username/FINMA_Career_Coach.git .

# Or if using SSH
# git clone git@github.com:your-username/FINMA_Career_Coach.git .
```

## Step 4: Set Up Python Environment

```bash
# Create virtual environment
python3.11 -m venv venv

# Activate virtual environment
source venv/bin/activate

# Upgrade pip
pip install --upgrade pip

# Install dependencies
pip install -r requirements.txt
```

## Step 5: Configure Environment Variables

Create environment file:

```bash
sudo nano /etc/environment
```

Add your API key:

```bash
ANTHROPIC_API_KEY="sk-ant-api03-your-key-here"
```

Save and exit (Ctrl+X, Y, Enter).

Apply changes:

```bash
source /etc/environment
```

**Security Note**: For production, use a more secure method like a `.env` file with restricted permissions:

```bash
# Create .env file
cat > /var/www/finma-career-coach/.env << EOF
ANTHROPIC_API_KEY=sk-ant-api03-your-key-here
EOF

# Restrict permissions
chmod 600 /var/www/finma-career-coach/.env
chown www-data:www-data /var/www/finma-career-coach/.env
```

Then update the systemd service to load from .env (see alternative service file below).

## Step 6: Configure Systemd Service

Copy service file:

```bash
sudo cp deployment/finma-career-coach.service /etc/systemd/system/
```

**IMPORTANT**: Edit the service file to add your API key:

```bash
sudo nano /etc/systemd/system/finma-career-coach.service
```

Replace `your_api_key_here` with your actual Anthropic API key.

Enable and start the service:

```bash
# Reload systemd
sudo systemctl daemon-reload

# Enable service (start on boot)
sudo systemctl enable finma-career-coach

# Start service
sudo systemctl start finma-career-coach

# Check status
sudo systemctl status finma-career-coach
```

Check logs if there are issues:

```bash
sudo journalctl -u finma-career-coach -f
```

## Step 7: Configure Nginx

Copy nginx configuration:

```bash
sudo cp deployment/nginx.conf /etc/nginx/sites-available/finma-career-coach
```

Edit the configuration:

```bash
sudo nano /etc/nginx/sites-available/finma-career-coach
```

Replace `your-domain.com` with:
- Your domain name (e.g., `career-coach.yourdomain.com`), OR
- Your droplet IP address (e.g., `142.93.xxx.xxx`)

Enable the site:

```bash
# Create symbolic link
sudo ln -s /etc/nginx/sites-available/finma-career-coach /etc/nginx/sites-enabled/

# Remove default site (optional)
sudo rm /etc/nginx/sites-enabled/default

# Test nginx configuration
sudo nginx -t

# Restart nginx
sudo systemctl restart nginx
```

## Step 8: Configure Firewall

```bash
# Allow SSH
sudo ufw allow OpenSSH

# Allow HTTP
sudo ufw allow 'Nginx HTTP'

# Allow HTTPS (for later SSL setup)
sudo ufw allow 'Nginx HTTPS'

# Enable firewall
sudo ufw enable

# Check status
sudo ufw status
```

## Step 9: Test Your Deployment

Open your browser and navigate to:
- `http://your-droplet-ip` OR
- `http://your-domain.com`

You should see your Streamlit app!

## Step 10: Add SSL Certificate (Recommended)

If you have a domain name, add free SSL with Let's Encrypt:

```bash
# Install certbot
sudo apt-get install -y certbot python3-certbot-nginx

# Get certificate (replace with your domain)
sudo certbot --nginx -d your-domain.com

# Certbot will automatically configure nginx for HTTPS
# Certificate auto-renews every 90 days
```

Test auto-renewal:

```bash
sudo certbot renew --dry-run
```

## Updating Your Application

When you make changes to your code:

### Method 1: Quick Deploy Script

```bash
# SSH into droplet
ssh root@your-droplet-ip

# Run deployment script
cd /var/www/finma-career-coach
./deployment/deploy.sh
```

### Method 2: Manual Update

```bash
cd /var/www/finma-career-coach
git pull origin main
source venv/bin/activate
pip install -r requirements.txt
sudo systemctl restart finma-career-coach
```

### Method 3: Regenerate Summaries

If you added new role profiles:

```bash
cd /var/www/finma-career-coach
source venv/bin/activate
python scripts/generate_summaries.py --all
sudo systemctl restart finma-career-coach
```

## Monitoring & Maintenance

### View Application Logs

```bash
# Real-time logs
sudo journalctl -u finma-career-coach -f

# Last 100 lines
sudo journalctl -u finma-career-coach -n 100

# Logs from today
sudo journalctl -u finma-career-coach --since today
```

### Check Service Status

```bash
sudo systemctl status finma-career-coach
```

### Restart Service

```bash
sudo systemctl restart finma-career-coach
```

### Monitor System Resources

```bash
# CPU and memory usage
htop

# Disk usage
df -h

# Check nginx access logs
sudo tail -f /var/log/nginx/access.log

# Check nginx error logs
sudo tail -f /var/log/nginx/error.log
```

## Troubleshooting

### Service Won't Start

Check logs:
```bash
sudo journalctl -u finma-career-coach -n 50
```

Common issues:
- Missing API key → Check /etc/systemd/system/finma-career-coach.service
- Port already in use → `sudo lsof -i :8501`
- Python dependencies → Reinstall with `pip install -r requirements.txt`

### Nginx 502 Bad Gateway

Check if Streamlit is running:
```bash
sudo systemctl status finma-career-coach
curl http://localhost:8501
```

### High Memory Usage

Monitor with:
```bash
free -h
htop
```

If needed, upgrade droplet or add swap:
```bash
sudo fallocate -l 2G /swapfile
sudo chmod 600 /swapfile
sudo mkswap /swapfile
sudo swapon /swapfile
```

### SSL Certificate Issues

```bash
# Test renewal
sudo certbot renew --dry-run

# Check certificate status
sudo certbot certificates
```

## Security Best Practices

1. **Keep System Updated**
   ```bash
   sudo apt-get update && sudo apt-get upgrade -y
   ```

2. **Use SSH Keys Only**
   ```bash
   # Disable password authentication
   sudo nano /etc/ssh/sshd_config
   # Set: PasswordAuthentication no
   sudo systemctl restart sshd
   ```

3. **Regular Backups**
   - Use Digital Ocean's automated backups ($1.20/month for $6 droplet)
   - Or manually backup `/var/www/finma-career-coach`

4. **Monitor API Usage**
   - Check Anthropic dashboard regularly
   - Set up billing alerts

5. **Restrict API Access**
   - Consider adding authentication to Streamlit
   - Use nginx basic auth or OAuth

## Cost Estimates

**Digital Ocean Costs:**
- Droplet: $6-12/month (depending on size)
- Backups: $1.20/month (optional)
- Domain: $12/year (optional, can use IP)
- **Total**: ~$7-15/month

**Anthropic API Costs:**
- Development (test mode): ~$0.04/conversation
- Production (20 summaries): ~$0.10/conversation
- Monthly estimate: Depends on usage (100 conversations = $10/month)

## Alternative: Docker Deployment

If you prefer Docker, see [DOCKER_DEPLOYMENT.md](DOCKER_DEPLOYMENT.md) (would need to be created).

## Getting Help

- Digital Ocean Docs: https://docs.digitalocean.com/
- Streamlit Deployment: https://docs.streamlit.io/deploy
- Nginx Docs: https://nginx.org/en/docs/

## Summary Checklist

- [ ] Create Digital Ocean droplet
- [ ] SSH into server
- [ ] Run setup script
- [ ] Clone repository
- [ ] Set up Python environment
- [ ] Configure environment variables
- [ ] Set up systemd service
- [ ] Configure nginx
- [ ] Configure firewall
- [ ] Test deployment
- [ ] Add SSL certificate (optional)
- [ ] Set up monitoring
- [ ] Configure backups

#!/bin/bash
set -e

# Navigate to application directory
cd ~/DevOpsCa

# Pull the latest changes from GitHub
git pull

# Install dependencies
npm install

# Restart the application with PM2
pm2 restart DevOpsCa || pm2 start bin/www --name "DevOpsCa"

# Save PM2 process list
pm2 save

echo "Deployment completed successfully!"
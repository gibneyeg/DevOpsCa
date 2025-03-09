#!/bin/bash
set -e

# Navigate to application directory
cd ~/DevOpsCa

# Fetch the latest changes
git fetch origin

# Reset to match remote branch (discards local changes)
git reset --hard origin/main

# Install dependencies
npm install

# Restart the application with PM2
pm2 restart DevOpsCa || pm2 start bin/www --name "DevOpsCa"

# Save the PM2 process list
pm2 save

echo "Deployment completed successfully!"
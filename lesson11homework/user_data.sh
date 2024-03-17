#!/bin/bash
# Update package index
yum update -y

# Install Apache HTTP Server
yum install httpd -y

# Start the Apache service
systemctl start httpd

# Enable Apache to start on boot
systemctl enable httpd

# Create a test HTML file
echo "<h1>Welcome to My Website!</h1>" > /var/www/html/index.html

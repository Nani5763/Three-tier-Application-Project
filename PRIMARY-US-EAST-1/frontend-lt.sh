#!/bin/bash

# Update package lists
sudo yum update -y

# Pause for 90 seconds (not recommended, but keeping it as per your script)
sleep 90

# Start and enable the Apache service
sudo systemctl start httpd
sudo systemctl enable httpd




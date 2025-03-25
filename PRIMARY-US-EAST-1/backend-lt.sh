#!/bin/bash
sudo yum update -y
sudo pm2 startup
sudo pm2 save
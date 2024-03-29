#!/bin/bash
sudo apt-get update
sudo apt-get install apache2 -y
sudo systemctl start apache2
sudo systemctl enable apache2
echo "<h1>Welcome to Terraform session</h1>" | sudo tee /var/www/html/index.html
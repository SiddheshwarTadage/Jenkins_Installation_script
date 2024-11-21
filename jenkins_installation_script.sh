#!/bin/bash

# Update the system
echo "Updating system packages..."
sudo apt update -y
sudo apt upgrade -y

# Install Java (required for Jenkins)
echo "Installing Java..."
sudo apt install openjdk-11-jdk -y

# Add Jenkins repository and key
echo "Adding Jenkins repository and key..."
curl -fsSL https://pkg.jenkins.io/debian-stable/jenkins.io.key | sudo tee \
    /usr/share/keyrings/jenkins-keyring.asc > /dev/null
echo deb [signed-by=/usr/share/keyrings/jenkins-keyring.asc] \
    https://pkg.jenkins.io/debian-stable binary/ | sudo tee \
    /etc/apt/sources.list.d/jenkins.list > /dev/null

# Update package list
echo "Updating package list after adding Jenkins repository..."
sudo apt update -y

# Install Jenkins
echo "Installing Jenkins..."
sudo apt install jenkins -y

# Start and enable Jenkins service
echo "Starting and enabling Jenkins service..."
sudo systemctl start jenkins
sudo systemctl enable jenkins

# Check Jenkins status
echo "Checking Jenkins service status..."
sudo systemctl status jenkins

# Display initial admin password
echo "Jenkins installation complete."
echo "Fetching initial admin password..."
sudo cat /var/lib/jenkins/secrets/initialAdminPassword

echo "You can access Jenkins at http://<your-server-ip>:8080"

#!/bin/bash

# Exit immediately if a command exits with a non-zero status
set -e

# Function to display messages
echo_message() {
    echo -e "\n==== $1 ====\n"
}

# Update and upgrade the system
echo_message "Updating the system"
sudo apt update && sudo apt upgrade -y

# Install required dependencies
echo_message "Installing required dependencies"
sudo apt install -y openjdk-11-jre-headless wget gnupg software-properties-common

# Clean any existing MongoDB sources and keys
echo_message "Cleaning up old MongoDB sources and keys"
sudo rm -f /etc/apt/sources.list.d/mongodb-org-*.list
sudo rm -f /usr/share/keyrings/mongodb-server-*.gpg

# Add MongoDB 6.0 repository and GPG key
echo_message "Adding MongoDB 6.0 repository and GPG key"
wget -qO - https://www.mongodb.org/static/pgp/server-6.0.asc | sudo gpg --dearmor -o /usr/share/keyrings/mongodb-server-6.0.gpg
echo "deb [signed-by=/usr/share/keyrings/mongodb-server-6.0.gpg] https://repo.mongodb.org/apt/ubuntu $(lsb_release -cs)/mongodb-org/6.0 multiverse" | sudo tee /etc/apt/sources.list.d/mongodb-org-6.0.list

# Update package lists and install MongoDB
echo_message "Updating package lists and installing MongoDB"
sudo apt update
sudo apt install -y mongodb-org

# Start and enable MongoDB service
echo_message "Starting and enabling MongoDB service"
sudo systemctl start mongod
sudo systemctl enable mongod

# Add UniFi repository and GPG key
echo_message "Adding UniFi repository and GPG key"
wget -qO - https://dl.ui.com/unifi/unifi-repo.gpg | sudo tee /usr/share/keyrings/unifi-archive-keyring.gpg > /dev/null
echo "deb [signed-by=/usr/share/keyrings/unifi-archive-keyring.gpg] https://www.ui.com/downloads/unifi/debian stable ubiquiti" | sudo tee /etc/apt/sources.list.d/unifi.list

# Update package lists and install UniFi
echo_message "Updating package lists and installing UniFi"
sudo apt update
sudo apt install -y unifi

# Start and enable UniFi service
echo_message "Starting and enabling UniFi service"
sudo systemctl start unifi
sudo systemctl enable unifi

# Final message
echo_message "Installation completed successfully. You can access the UniFi Controller at https://localhost:8443"


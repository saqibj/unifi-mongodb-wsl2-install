# unifi-mongodb-wsl2-install
Automate the process of installing MongoDB and the UniFi Controller on WSL 2

## Description

This repository provides a convenient Bash script to automate the installation of MongoDB and the UniFi Network Controller on Windows Subsystem for Linux 2 (WSL 2) with Ubuntu 22.04 ("jammy"). 

## Features

- **Automated Setup**: The script handles the complete installation process, including setting up necessary repositories and keys, installing dependencies, and starting services.
- **MongoDB 6.0**: Adds and configures the MongoDB 6.0 repository, ensuring compatibility with Ubuntu 22.04.
- **UniFi Network Controller**: Installs and configures the UniFi Controller, making it ready for managing your UniFi devices.
- **Easy to Use**: Simple to execute with a single script that handles everything.

## Usage

1. Download the script:
   ```bash
   wget https://raw.githubusercontent.com/saqibj/unifi-mongodb-wsl2-install/main/install-unifi-mongodb.sh
   ```
2. Make the script executable:
   ```bash
   chmod +x install-unifi-mongodb.sh
   ```
3. Run the script:
   ```bash
   ./install-unifi-mongodb.sh
   ```


## Requirements

- WSL 2 with Ubuntu 22.04
- Internet connection to download packages and keys

## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

---

This description should provide clear guidance on what the repository does and how to use the script effectively.

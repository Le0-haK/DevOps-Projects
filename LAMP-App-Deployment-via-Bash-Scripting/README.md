# LAMP Stack E-commerce App Configuration & Deployment Automation on CentOS

This project is a task from the **KodeKloud Bash Scripting Course**, where I automated the full configuration and deployment of a **LAMP Stack** (Linux, Apache, MySQL/MariaDB, PHP) based e-commerce application on **CentOS** using a **single-node model**.

---

## 📌 Project Objective

Automate the setup of an e-commerce web application hosted on a LAMP stack using Bash scripting.

---

## 🔧 What the Script Does

This script automates the setup of a LAMP stack environment and deploys an e-commerce application on a CentOS/RHEL system.

---
### 1. Installs and Configures Essential Components

- **firewalld**: Configures system firewall to allow necessary traffic:
  - **Port 80** for HTTP (Apache)
  - **Port 3306** for MySQL (MariaDB)

- **Apache**: Installs and configures Apache to serve the e-commerce app from `/var/www/html`.

- **MariaDB**: Installs MariaDB and:
  - Creates a database `ecomdb`
  - Creates a user `ecomuser` with full privileges

- **PHP**: Installs PHP and required extensions for backend and database operations.

- **Git**: Installs Git to enable cloning the e-commerce application from GitHub.

---

### 2. Opens Necessary Firewall Ports

To ensure proper connectivity, the script opens:

- **Port 80** – HTTP traffic for the web application  
- **Port 3306** – MariaDB traffic for database communication

---

### 3. Sets Up Database

The script runs a SQL configuration file `config-db.sql` to:

- Create the `ecomdb` database
- Add a `ecomuser` with full access to the database
- Create a `products` table
- Insert sample product data (e.g., **Laptop**, **Drone**, **Phone**)

---

### 4. Generates a `.env` File

- Creates a `.env` file containing **secure database credentials**
- This prevents hardcoding sensitive data directly in the PHP codebase.

---

### 5. Modifies PHP Code to Use `.env`

- Updates `index.php` in the application
- Adds a `loadEnv()` function to load credentials from `.env`
- Connects to the database using environment variables for enhanced **security and flexibility**

---

### 6. Clones the E-commerce Application

- Clones the application from:
  [https://github.com/kodekloudhub/learning-app-ecommerce.git](https://github.com/kodekloudhub/learning-app-ecommerce.git)
- Deploys the app to `/var/www/html`
- **Cleans the target directory** before cloning to avoid Git errors

---

### 7. Error Logging and Status Updates

The script includes:

- **Color-coded terminal output**:
  - 🟢 Green: Success messages
  - 🔴 Red: Error messages
- **Logging**: Helps identify issues during deployment with clear error reporting

---

## 🚀 How to Use

### Prerequisites:
- CentOS/RHEL system 
- Root/Sudo access for installation
- Internet connection for downloading packages and cloning the GitHub repository

### Steps to Execute:
   ```bash
   chmod +x deploy.sh-ecommerce-application.sh
   sudo ./deploy.sh-ecommerce-application.sh
   ```

## 📝 Troubleshooting

If you encounter issues during the deployment, the script will provide error messages in the **/var/log/ecom-app-error.log**

## 📸 Screenshots

Add screenshots of the terminal output, application UI, or directory structure if available.

## 🤝 Acknowledgments

This project was created as part of the [KodeKloud Bash Scripting Course](https://learn.kodekloud.com/user/courses/shell-scripts-for-beginners?refererPath=%2Fuser%2Flearning-paths%2Fdevops-engineer&refererTitle=DevOps+Engineer)

#!/bin/bash

logfile="/var/log/ecom-app-error.log" # Log errors (stderr)
host_dir="/var/www/html" # Root of your project folder

check_log_file(){
    if [ -e logfile ]; then
        echo "$logfile File Exist"
    else
        sudo touch $logfile
        echo "$logfile file not existed, So we created it first"
    fi
}

# Function use to color the text
print_color() {
  local color=$1
  local text=$2

  case $color in
    red) code=31 ;; # Used to print failed or error outcome message
    green) code=32 ;; # Used to print successful outcome message
    *) code=0 ;;  # Default (no color)
  esac

  echo -e "\e[1;${code}m${text}\e[0m"
}

# Function to check the Exit status code of the "systemctl status <service>" command to find if the serivce is active or not
check_service_status(){

    local service=$1

    echo "Checking status of $service..."
    if systemctl is-active --quiet "$service"; then
        print_color green "$service is running"
    else
        print_color red "$service is NOT running"
        exit 1
    fi

}

# Function Config the Firewalld
confg_firewalld() {

    # Install firewalld 
    echo "Installing firewalld..."
    sudo yum install -y firewalld > /dev/null 2>> $logfile || { print_color red "Firewalld Install failed, Check App Logs at $logfile"; exit 1; }

    # Enable firewalld Service
    echo "Enabling firewalld on boot..."
    sudo systemctl enable firewalld --now > /dev/null 2>> $logfile || { print_color red "Firewalld Enable failed, Check App Logs at $logfile"; exit 2; }

    # Confirm status of firewalld Service
    check_service_status firewalld

    print_color green "Firewalld installed and running."

}

# Function to Config MariaDB 
confg_db() {
    
    # Install MariaDB
    echo "Installing MariaDB-Server..."
    sudo yum install -y mariadb-server.x86_64 > /dev/null 2>> $logfile || { print_color red "MariaDB Install failed, Check App Logs at $logfile"; exit 1; }
    
    # Enable MariaDB Service
    echo "Enabling MariaDB-Server on boot..."
    sudo systemctl enable mariadb --now > /dev/null 2>> $logfile || { print_color red "MariaDB Enable failed, Check App Logs at $logfile"; exit 2; }

    # Confirm status of MariaDB Service
    check_service_status mariadb

    print_color green "MariaDB installed and running."
    
    # Add Firewall Rule to Allow MariaDB 
    echo "Adding Firewall Rule to Allow MariaDB TCP 3306 on Internet..."
    sudo firewall-cmd --permanent --zone=public --add-port=3306/tcp > /dev/null 2>> $logfile || { print_color red "MariaDB Rule Creation Failed, Check App Logs at $logfile"; exit 3; }
    sudo firewall-cmd --reload > /dev/null 2>> $logfile || { print_color red "Firewalld Service Restart Failed, Check App Logs at $logfile"; exit 4; }

    print_color green "MariaDB Port 3306 (tcp) Allowed on Firewalld"
    sleep 2

    # Create Database, User and Grant Privilege to that User, Also Table in the DB and Insert multiple rows into the table
    echo "Creating DB, User, Grant Privilege to that user"
    echo "Creating Table in the DB and Uploading data"

cat > config-db.sql <<EOF 
CREATE DATABASE ecomdb;
CREATE USER 'ecomuser'@'localhost' IDENTIFIED BY 'ecompassword';
GRANT ALL PRIVILEGES ON *.* TO 'ecomuser'@'localhost';
FLUSH PRIVILEGES;
USE ecomdb;
CREATE TABLE products (id mediumint(8) unsigned NOT NULL auto_increment,Name varchar(255) default NULL,Price varchar(255) default NULL, ImageUrl varchar(255) default NULL,PRIMARY KEY (id)) AUTO_INCREMENT=1;
INSERT INTO products (Name,Price,ImageUrl) VALUES ("Laptop","100","c-1.png"),("Drone","200","c-2.png"),("VR","300","c-3.png"),("Tablet","50","c-5.png"),("Watch","90","c-6.png"),("Phone Covers","20","c-7.png"),("Phone","80","c-8.png"),("Laptop","150","c-4.png");
EOF

    sudo mysql < config-db.sql || { print_color red "SQL Commands Failed to Execute, Check App Logs at $logfile"; exit 5; }

    mysql_db_result=$(sudo mysql -e "use ecomdb; select * from products;")

    if [[ $mysql_db_result = *Laptop* ]]; then 
        print_color green "Data Updated on the App's DB"
    else
        print_color red "Data not updated on the App's DB"
        exit 6
    fi

    print_color green "MariaDB Configured"

}

# Function to restart the Apache Webserver
restart_websrv() {
    echo "Restarting Apache Service"
    sudo systemctl restart httpd > /dev/null 2>>$logfile || { print_color red "Apache Service Failed to Restart", Check App Logs at $logfile; exit 1;  }
}

# Function to configure Apache and Install PHP Runtime, DB Driver

config_websrv() {

    # Install Apache, PHP-Runtime and PHP-MariaDB DB Driver
    echo "Installing PHP-Runtime..."
    sudo yum install -y php > /dev/null 2>> $logfile || { print_color red "PHP Runtime Install failed, Check App Logs at $logfile"; exit 1; }
    print_color green "PHP-Runtime installed"

    echo "Installing PHP-MariaDB Database Driver..."
    sudo yum install -y php-mysqlnd > /dev/null 2>> $logfile || { print_color red "DB Driver Install failed, Check App Logs at $logfile"; exit 2; }
    print_color green "PHP-MariaDB DB Driver Installed"

    echo "Installing Apache Webserver..."
    sudo yum install -y httpd > /dev/null 2>> $logfile || { print_color red "Apache Install failed, Check App Logs at $logfile"; exit 3; }
    echo "Enabling Apache Webserver on boot..."
    sudo systemctl enable httpd --now > /dev/null 2>> $logfile || { print_color red "Apache Enable Failed, Check App Logs at $logfile"; exit 4; }

    # Confirm status of Apache Service
    check_service_status httpd

    print_color green "Apache WebServer installed and running."

    # Add Firewall Rule to Allow Apache
    sudo firewall-cmd --permanent --zone=public --add-port=80/tcp > /dev/null 2>> $logfile || { print_color red "Apache Rule Creation Failed, Check App Logs at $logfile"; exit 5; }
    sudo firewall-cmd --reload > /dev/null 2>> $logfile || { print_color red "Firewalld Service Restart Failed, Check App Logs at $logfile"; exit 6; }

    print_color green "Apache Port 80 (tcp) Allowed on Firewalld"
    sleep 2

    # Change the default/Landing page
    echo "Updating default/Landing Page in httpd.conf file"
    sudo sed -i 's/index.html/index.php/g' /etc/httpd/conf/httpd.conf > /dev/null 2>> $logfile || { print_color red "Failed to update the Default/Landing Page, Check App Logs at $logfile"; exit 7; }
    print_color green "Default/Landing Page Updated in httpd.conf file"
    restart_websrv

# Create an .env file in the root of your project folder which will be used by App to connect to the MariaDB Database
    echo "Creating .env file at the $(pwd)"
    # sudo touch .env 

cat > .env <<EOF
DB_HOST=localhost
DB_USER=ecomuser
DB_PASSWORD=ecompassword
DB_NAME=ecomdb
EOF
    print_color green ".env file Created"
}

# Function to Clone the Github Repo of App Code

clone_code() {

    # Install git
    echo "Installing Git..."
    sudo yum install -y git > /dev/null 2>> $logfile || { print_color red "Git Install Failed, Check App Logs at $logfile"; exit 1; }
    print_color green "Git Installed"

    # Clone App's Repo
    echo "Cloning App's Github Repo"
    sudo git clone https://github.com/kodekloudhub/learning-app-ecommerce.git $host_dir > /dev/null 2>> $logfile || { print_color red "Repo Cloning Failed, Check App Logs at $logfile"; exit 1; }
    print_color green "App's Repo Cloned and moved to $host_dir"

    echo "Moving .env from $(pwd) to $host_dir"
    sudo mv .env $host_dir > /dev/null 2>> $logfile || { print_color red ".env Failed to Move, Check App Logs at $logfile"; exit 4; }
    print_color green ".env file moved to $host_dir"
}

# Function to Update the index.php file to load the environment variables from the .env file 
Edit_the_code() {
    local target_file="$host_dir/index.php"

read -r -d '' php_block <<'EOF'
// Function to load environment variables from a .env file
function loadEnv($path)
{
    if (!file_exists($path)) {
        return false;
    }

    $lines = file($path, FILE_IGNORE_NEW_LINES | FILE_SKIP_EMPTY_LINES);
    foreach ($lines as $line) {
        if (strpos(trim($line), '#') === 0) {
            continue;
        }

        list($name, $value) = explode('=', $line, 2);
        $name = trim($name);
        $value = trim($value);
        putenv(sprintf('%s=%s', $name, $value));
    }
    return true;
}

// Load environment variables from .env file
loadEnv(__DIR__ . '/.env');

EOF

# Insert before the environment variable section
pattern="// Fetch database connection details directly from environment variables"
temp_file=$(mktemp)

awk -v insert="$php_block" -v pattern="$pattern" '
{
    if ($0 ~ pattern && !done) {
        print insert;
        done=1
    }
    print
}' "$target_file" > "$temp_file" && mv "$temp_file" "$target_file"

if [ $? -eq 0 ]; then
    echo "loadEnv block inserted" 
else
    echo "Failed to insert loadEnv block" 
    exit 1
fi

sudo chmod u=rwx,g=rx,o=rx $target_file > /dev/null 2>> $logfile || { print_color red "Permssion granting failed, Check App Logs at $logfile"; exit 1; }
    
}

# Function to check the status of the App
check_website_status() {
    local app_url="http://localhost"
    response=$(curl -s -o /dev/null -w "%{http_code}" $app_url)

    if [ "$response" -eq 200 ]; then
        print_color green "Website is up and Running, You can check via $app_url"
    else
        print_color red "Website check failed. HTTP status code: $response"
        exit 1
    fi
}


# Main 
confg_firewalld 
confg_db
config_websrv
clone_code
Edit_the_code
check_website_status


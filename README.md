#                           Three-tier-Application-Project
-----------------------------------------------------------------------------------------------
# Public Frontend server
# Give these commmands into terminal
* cd Project
* ls
* cd frontend
* cd src/
* cd pages
* sudo npm install
* cd ../..
* sudo npm run build
* ls
* sudo cp -r build/* /var/www/html

# Public Backend Server
# Give these commands into terminal
* cd Project
* ls
* cd backend
* ls
* vi .env   #check the database credentials
* sudo npm install
* sudo npm install dotenv
* sudo pm2 start index.js --name "backendApi"
* sudo pm2 list

# connect Bastion host public instance to private Backend instance
1. connect public instance
2. create vi <key-name>.pem
3. paste the private key we are using same key that key
4. give the permission of key chmod 400 <key-name>.pem
5. let's connect the private server by using below command

* ssh -i key.pem ec2-user@<Private_IP_add_backend_server>
* sudo ssh -i Project-key.pem ec2-user@54.211.226.38

# Install after connect Backend server
1. Download the MySQL 8.0 community release package. This ensures you get the correct
repository configuration for MySQL 8.0:

* sudo wget https://dev.mysql.com/get/mysql80-community-release-el9-4.noarch.rpm

2. Install the MySQL community release package. This adds the MySQL repository to your system:

* sudo dnf install mysql80-community-release-el9-4.noarch.rpm -y

3. Install MySQL server

* sudo dnf install mysql-community-server -y

4. Verify MySQL installation. Check the installed MySQL version:

* mysql -V

5. Start and Enable MySQL Service and Start the MySQL service and configure it to run on boot:

* sudo systemctl start mysqld
* sudo systemctl enable mysqld

6. Check MySQL service status

* sudo systemctl status mysqld


# And type the below command to initialize the database.
* mysql -h book.rds.com -u <user_name_of_rds> -p<password_of_rds> test < test.sql
* mysql -h book.rds.com -u admin -pPavan5763 test < test.sql

# if above one not works connect to your database by using 
* mysql -h book.rds.com -u <user_name_of_rds> -p<password_of_rds
* mysql -h book.rds.com -u admin -pPavan5763

# Again give the below command
* mysql -h book.rds.com -u <user_name_of_rds> -p<password_of_rds> test < test.sql
* mysql -h book.rds.com -u admin -pPavan5763 test < test.sql
# Stop MySQL
sudo service mysql stop
# Make MySQL service directory.
sudo mkdir /var/run/mysqld
# Give MySQL user permission to write to the service directory.
sudo chown mysql: /var/run/mysqld
# Start MySQL manually, without permission checks or networking.
sudo mysqld_safe --skip-grant-tables --skip-networking &
# Log in without a password.
mysql -uroot mysql
Update the password for the root user.

UPDATE mysql.user SET authentication_string=PASSWORD('0000'), plugin='mysql_native_password' WHERE User='root' AND Host='local';
EXIT;
# Turn off MySQL.
sudo mysqladmin -S /var/run/mysqld/mysqld.sock shutdown
# Start the MySQL service normally.
sudo service mysql start

Modified from
Jon Peck
https://coderwall.com/p/j9btlg/reset-the-mysql-5-7-root-password-in-ubuntu-16-04-lts

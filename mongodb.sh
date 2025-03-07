
cp mongo.repo /home/centos/Roboshop/mongod.conf
dnf install mongodb-org -y 


systemctl enable mongod 
systemctl start mongod 


systemctl restart mongod
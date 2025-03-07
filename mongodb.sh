
cp mongo.repo /etc/mongod.conf
dnf install mongodb-org -y 


systemctl enable mongod 
systemctl start mongod 


systemctl restart mongod
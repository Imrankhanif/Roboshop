echo -e "\e[33m Copy mongodb repo file\e[0m"
cp mongo.repo /home/centos/Roboshop/mongod.conf

echo -e "\e[33m Install Mongodb\e[0m"
dnf install mongodb-org -y 

echo -e "\e[33m enable mondodb\e[0m"
systemctl enable mongod 
echo -e "\e[33m start mongodb\e[0m"
systemctl start mongod 

echo -e "\e[33m Restart mongodb\e[0m"
systemctl restart mongod
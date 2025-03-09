echo -e "\e[33m Copy mongodb repo file\e[0m"
cp mongo.repo /etc/yum.repos.d/mongo.repo   &>>/tmp/roboshop.log

echo -e "\e[33m Install Mongodb\e[0m"
yum install mongodb-org -y  &>>/tmp/roboshop.log

sed -i 's/127.0.0.1/0.0.0.0/' /etc/mongod.conf


echo -e "\e[33m enable mondodb\e[0m"
systemctl enable mongod  &>>/tmp/roboshop.log
echo -e "\e[33m start mongodb\e[0m"
systemctl start mongod  &>>/tmp/roboshop.log

echo -e "\e[33m Restart mongodb\e[0m"
systemctl restart mongod &>>/tmp/roboshop.log
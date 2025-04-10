


echo -e "\e[33m Configuration NodeJS   Repos\e[0m"
curl -sL https://rpm.nodesource.com/setup_lts.x | bash  &>>/tmp/roboshop.log

echo -e "\e[33m Install NodeJS\e[0m"
dnf install nodejs -y

echo -e "\e[33m Add Application User\e[0m"
useradd roboshop

echo -e "\e[33m Create Application directory\e[0m"
rm -rf /app 
mkdir /app

echo -e "\e[33m Download Application Content\e[0m"
curl -o /tmp/catalogue.zip https://roboshop-artifacts.s3.amazonaws.com/catalogue.zip 
cd /app 

echo -e "\e[33  Extract Application content\e[0m"
unzip /tmp/catalogue.zip
cd /app

echo -e "\e[33  Install Nodejs Dependencies\e[0m"
npm install 


cp /home/centos/Roboshop/catalogue.service  /etc/systemd/system/catalogue.service


echo -e "\e[33  start catalogue.service \e[0m"
systemctl daemon-reload

systemctl enable catalogue 
systemctl start catalogue

echo -e "\e[33 copy mongodb repo file \e[0m"
cp /home/centos/Roboshop/mongo.repo  /etc/yum.repos.d/mongo.repo

echo -e "\e[33 Install Mongodb client  \e[0m"
dnf install mongodb-org-shell -y

echo -e "\e[33 load schema  \e[0m"
mongo --host MONGODB-SERVER-IPADDRESS </app/schema/catalogue.js


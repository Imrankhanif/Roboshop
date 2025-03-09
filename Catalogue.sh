
echo -e "\e[33m Disable nodejs\e[0m"
dnf module disable nodejs -y

echo -e "\e[33m Enable nodejs\e[0m"
dnf module enable nodejs:18 -y

echo -e "\e[33m Installing nodejs\e[0m"
dnf install nodejs -y

echo -e "\e[33m adding roote user\e[0m"
useradd roboshop

echo -e "\e[33m creadting folder\e[0m"
mkdir /app 

echo -e "\e[33m downloading catalogue\e[0m"
curl -o /tmp/catalogue.zip https://roboshop-artifacts.s3.amazonaws.com/catalogue.zip 

echo -e "\e[33m IN APP\e[0m"
cd /app 

echo -e "\e[33m EXTRACT THE FILE\e[0m"
unzip /tmp/catalogue.zip

echo -e "\e[33m In app \e[0m"
cd /app 

echo -e "\e[33m Downloading dependencie\e[0m"
npm install 

echo -e "\e[33m daemon reload\e[0m"
systemctl daemon-reload

echo -e "\e[33m enableing the catalogue\e[0m"
systemctl enable catalogue

echo -e "\e[33m start caralogue\e[0m"
systemctl start catalogue

echo -e "\e[33m Copy mongo repo file\e[0m"
cp mongo.repo /etc/yum.repos.d/mongo.repo

echo -e "\e[33m Installing mongodb\e[0m"
dnf install mongodb-org-shell -y


mongo --host mongodb-dev.imrankhandevops72.online </app/schema/catalogue.js
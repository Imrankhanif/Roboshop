dnf module disable nodejs -y
dnf module enable nodejs:18 -y

dnf install nodejs -y


useradd roboshop


mkdir /app 


curl -o /tmp/catalogue.zip https://roboshop-artifacts.s3.amazonaws.com/catalogue.zip 
cd /app 
unzip /tmp/catalogue.zip

cd /app 
npm install 

cp catalogue.service /home/centos/Roboshop/catalogue.service

systemctl daemon-reload

systemctl enable catalogue 
systemctl start catalogue


cp mongo.repo /home/centos/Roboshop/mongo.repo

dnf install mongodb-org-shell -y

mongo --host mongodb-dev.imrankhandevops72.online </app/schema/catalogue.js
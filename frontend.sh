
echo -e "\e[33m Installing Nginx server\e[0m"
dnf install nginx -y &>>/tmp/roboshop.log
echo -e "\e[34m enable Nginx server\e[0m"
systemctl enable nginx &>>/tmp/roboshop.log
echo -e "\e[33m start Nginx server\e[0m"
systemctl start nginx &>>/tmp/roboshop.log
echo -e "\e[33m remove old app content\e[0m"
rm -rf /usr/share/nginx/html/* &>>/tmp/roboshop.log

echo -e "\e[33m Download frontend content\e[0m"
curl -o /tmp/frontend.zip https://roboshop-artifacts.s3.amazonaws.com/frontend.zip &>>/tmp/roboshop.log

echo -e "\e[33m extract frontend contend\e[0m"
cd /usr/share/nginx/html  &>>/tmp/roboshop.log
unzip /tmp/frontend.zip   &>>/tmp/roboshop.log


#vim /etc/nginx/default.d/roboshop.conf 

echo -e "\e[33m restart frontend\e[0m"
systemctl restart nginx  &>>/tmp/roboshop.log
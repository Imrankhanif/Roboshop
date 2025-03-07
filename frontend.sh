
echo -e "\e[33m Installing Nginx server \e[0m"
yum install nginx -y 
echo -e "\e[33m Removing old app content \e[0m"

rm -rf /usr/share/nginx/html/*

echo -e "\e[33m Downloading Froentend content \e[0m"
curl -o /tmp/frontend.zip https://roboshop-artifacts.s3.amazonaws.com/frontend.zip 

echo -e "\e[35m extract Froentend content \e[0m"

cd /usr/share/nginx/html 
unzip /tmp/frontend.zip

#cp roboshop.conf /etc/nginx/default.d/roboshop.conf 

systemctl enable nginx 
systemctl restart nginx 
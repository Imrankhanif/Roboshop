echo -e "\e[33m Install remi repo\e[0m"
yum install https://rpms.remirepo.net/enterprise/remi-release-8.rpm -y


echo -e "\e[33m enable redis remi\e[0m"
yum module enable redis:remi-6.2 -y

echo -e "\e[33m DInstal redis\e[0m"
yum install redis -y 

echo -e "\e[33m chanege ip address\e[0m"
sed -i 's/127.0.0.1/0.0.0.0/' /etc/redis.conf

echo -e "\e[33m enable redis\e[0m"
systemctl enable redis 

echo -e "\e[33m start redis\e[0m"
systemctl start redis 



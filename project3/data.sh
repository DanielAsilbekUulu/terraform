#!/bin/bash     #don't forget this bin bash thing
yum update -y
yum install -y httpd.x86_64
systemctl start httpd.service
systemctl enable httpd.sevice
echo "Hello World from $(hostname -f)" > /var/www/html/index.html     #hostname = instance name 


# Now we dont install apache manually.  # terraform gonna do it 
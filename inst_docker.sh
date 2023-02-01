##ubuntu
#sudo apt update
#sudo apt install -y docker.io
## centos
#sudo yum install -y docker.io

curl -fsSL https://get.docker.com | bash -s docker --mirror Aliyun

sudo systemctl start docker
sudo systemctl enable docker
sudo groupadd docker
sudo gpasswd -a $USER docker
newgrp docker
docker ps -a


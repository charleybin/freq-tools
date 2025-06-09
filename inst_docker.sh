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


[add insecure-registries]
/etc/docker/daemon.json
{
  "insecure-registries": ["aa.bb.cc.dd"]
}

openssl s_client -connect aa.bb.cc.dd:443 -showcerts </dev/null 2>/dev/null | openssl x509 -outform PEM > registry.crt

sudo cp registry.crt /usr/local/share/ca-certificates/
sudo update-ca-certificates

docker login aa.bb.cc.dd
docker pull aa.bb.cc.dd/xxx

copied from  https://github.com/dreamrover/v2ray-deb


下载deb安装包：

wget https://github.com/dreamrover/v2ray-deb/releases/download/4.45.2/v2ray-4.45.2-amd64.deb
并通过如下命令安装：

sudo dpkg -i v2ray-4.45.2-amd64.deb

sudo unlink /etc/v2ray/config.json
sudo ln -s /etc/v2ray/client.json /etc/v2ray/config.json


修改配置文件后须重启v2ray服务使之生效：

sudo systemctl restart v2ray
生成用户ID（UUID）的方法：

cat /proc/sys/kernel/random/uuid




 
自行打包生成deb安装包（AMD64）
git clone https://github.com/dreamrover/v2ray-deb.git
cd v2ray-deb
chmod +x build.sh
./build.sh


卸载（保留配置文件和日志）：

sudo dpkg -r v2ray
或者

sudo apt-get remove v2ray
完全卸载（移除配置文件和日志）：

sudo apt-get purge v2ray




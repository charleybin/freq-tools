docker run --name mysql-server -p 3306:3306 -e MYSQL_ROOT_PASSWORD=a123456 -v /home/work/mys1-root:/etc/mysql/confi.d --restart=on-failure:3 -d mysql

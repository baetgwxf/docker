#docker run -itd -P --name tomcat8 -h tomcat8 baetgwxf/tomcat8:v1
#docker run -itd -p 33:22 --privileged --name tomcat8 -h tomcat8 baetgwxf/tomcat8:v1 /usr/sbin/init
docker run -itd -P --privileged --name tomcat8v1 -h tomcat8v1 --restart=always -m 1024m baetgwxf/tomcat8:v1 /usr/sbin/init
docker exec -it tomcat8v1 bin/bash

docker stop tomcat8v1 && docker rm tomcat8v1 && docker rmi baetgwxf/tomcat8:v1
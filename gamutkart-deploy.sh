#!/bin/bash
if [ $ENV = dev ]; then
	scp target/gamutgurus.war root@172.17.0.2:/root/apache-tomcat-9.0.59/webapps
	ssh root@172.17.0.2 startup.sh
elif [ $ENV = prod ]; then
        scp target/gamutgurus.war root@172.17.0.3:/root/apache-tomcat-9.0.59/webapps
        ssh root@172.17.0.3 startup.sh
fi

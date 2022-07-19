FROM 9dnyanesh/docker-base-image:14
COPY target/gamutgurus.war /opt/apache-tomcat-8.5.81/webapps
CMD /opt/apache-tomcat-8.5.81/bin/startup.sh && /bin/bash
EXPOSE 8082 8080

FROM 9dnyanesh/docker-base-image:14
COPY target/gamutgurus.war /opt/apache-tomcat-8.5.81/webapps
CMD startup.sh
EXPOSE 8082 8080

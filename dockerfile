FROM ubuntu:16.04 
MAINTAINER "9dnyanesh@gmail.com"
RUN apt-get update
RUN apt-get install -y openjdk-8-jdk
ENV JAVA_HOME /usr
ADD apache-tomcat-8.5.38.tar.gz /opt
COPY target/gamutgurus.war /opt/apache-tomcat-8.5.38/webapps
ENV PATH=$PATH:/root/apache-tomcat-8.5.38/bin
RUN apt-get update && apt-get install openssh-server -y
ENTRYPOINT startup.sh && service ssh start && bash
EXPORT 8080 8082

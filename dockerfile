FROM ubuntu:16.04 
MAINTAINER "9dnyanesh@gmail.com"
RUN apt-get update
RUN apt-get install -y openjdk-8-jdk
ENV JAVA_HOME /usr
ADD apache-tomcat-8.5.38.tar.gz /root
COPY target/gamutgurus.war /root/apache-tomcat-8.5.38/webapps
ENV PATH=$PATH:/root/apache-tomcat-8.5.38/bin
RUN apt-get update && apt-get install openssh-server -y
ENTRYPOINT startup.sh && service ssh start && bash


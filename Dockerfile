FROM ubuntu:latest

RUN mkdir /opt/aem
WORKDIR /opt/aem

RUN apt-get update
RUN apt-get install -y software-properties-common 
RUN add-apt-repository ppa:webupd8team/java
RUN apt-get update

# automatically accept oracle license
RUN echo oracle-java7-installer shared/accepted-oracle-license-v1-1 select true | /usr/bin/debconf-set-selections
# and install java 8 oracle jdk
RUN apt-get -y install oracle-java8-installer && apt-get clean
RUN update-alternatives --display java
ENV JAVA_HOME /usr/lib/jvm/java-8-oracle

ADD cq-author-p4502.jar /opt/aem/cq-author-p4502.jar
ADD license.properties /opt/aem/license.properties
ADD aem6 /etc/init.d/aem6
RUN chmod +x /etc/init.d/aem6
RUN update-rc.d aem6 defaults

RUN java -jar cq-author-p4502.jar -unpack -v
#CMD java -jar cq-62-p4503.jar -debug 58242

RUN echo "root:root" | chpasswd



EXPOSE 4502 80 443 58242
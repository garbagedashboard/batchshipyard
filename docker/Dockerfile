# Dockerfile for Caffe-CPU for use with Batch Shipyard on Azure Batch

FROM ubuntu:16.04
MAINTAINER Daisy Deng

USER root
RUN apt-get update && \
      apt-get -y install sudo &&\
      apt-get -y install software-properties-common

RUN sudo apt-get -y install  apt-transport-https

RUN useradd -m docker && echo "docker:docker" | chpasswd && adduser docker sudo

ADD /sudoers.txt /etc/sudoers
RUN chmod 440 /etc/sudoers

USER docker
CMD /bin/bash


########## install.NET Core SDK https://www.microsoft.com/net/core#linuxubuntu
RUN sudo sh -c 'echo "deb [arch=amd64] https://apt-mo.trafficmanager.net/repos/dotnet-release/ xenial main" > /etc/apt/sources.list.d/dotnetdev.list'
RUN sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys 417A0893
RUN sudo apt-get update


RUN sudo apt-get -y install dotnet-dev-1.0.4

######################  install AzCopy Linux Preview https://azure.microsoft.com/en-us/blog/announcing-azcopy-on-linux-preview/
RUN sudo apt-get -y install wget
WORKDIR "~/"
RUN pwd
RUN wget -O ~/azcopy.tar.gz https://aka.ms/downloadazcopyprlinux
RUN chmod 777 ~/azcopy.tar.gz
RUN mkdir ~/azcopy
RUN sudo tar -xf ~/azcopy.tar.gz -C ~/azcopy
RUN sudo /bin/bash ~/azcopy/install.sh


############java


# Install Java.
USER root
RUN \
  echo oracle-java8-installer shared/accepted-oracle-license-v1-1 select true | debconf-set-selections && \
  add-apt-repository -y ppa:webupd8team/java && \
  apt-get update && \
  apt-get install -y oracle-java8-installer && \
  rm -rf /var/lib/apt/lists/* && \
  rm -rf /var/cache/oracle-jdk8-installer


# Define working directory.
WORKDIR /home/docker

# Define commonly used JAVA_HOME variable
ENV JAVA_HOME /usr/lib/jvm/java-8-oracle

# Define default command.

###################################################### spark####################################



#RUN sudo apt-get -y install curl

ARG SPARK_ARCHIVE=http://d3kbcqa49mib13.cloudfront.net/spark-2.1.0-bin-hadoop2.7.tgz
#RUN wget $SPARK_ARCHIVE 

RUN wget -O ~/spark-2.1.0-bin-hadoop2.7.tgz $SPARK_ARCHIVE
RUN chmod 777 ~/spark-2.1.0-bin-hadoop2.7.tgz
RUN mkdir /usr/local/spark-2.1.0-bin-hadoop2.7
RUN sudo tar -xf ~/spark-2.1.0-bin-hadoop2.7.tgz -C /usr/local/spark-2.1.0-bin-hadoop2.7


ENV SPARK_HOME /usr/local/spark-2.1.0-bin-hadoop2.7
ENV PATH $PATH:$SPARK_HOME/bin

#COPY ha.conf $SPARK_HOME/conf

EXPOSE 4040 6066 7077 8080

#WORKDIR $SPARK_HOME


COPY test.py /home/docker/
COPY ips.csv /home/docker/

#RUN mkdir ~/testdata/
#RUN sudo chmod u+x /home/docker/converter.sh

CMD ["bash"]
#RUN cd ~/ \
#    && /bin/bash /home/docker/converter.sh

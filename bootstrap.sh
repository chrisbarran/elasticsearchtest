#!/usr/bin/env bash

wget -O - http://packages.elasticsearch.org/GPG-KEY-elasticsearch |  apt-key add -
 
echo "deb http://packages.elasticsearch.org/elasticsearch/1.0/debian stable main" |  tee -a /etc/apt/sources.list

echo "deb http://packages.elasticsearch.org/logstash/1.3/debian stable main" |  tee -a /etc/apt/sources.list

export DEBIAN_FRONTEND=noninteractive

apt-get install python-software-properties

add-apt-repository -y ppa:webupd8team/java

echo debconf shared/accepted-oracle-license-v1-1 select true |  debconf-set-selections

echo debconf shared/accepted-oracle-license-v1-1 seen true |  debconf-set-selections

apt-get update

apt-get install -y oracle-java7-installer

apt-get install elasticsearch

update-rc.d elasticsearch defaults 95 10

/etc/init.d/elasticsearch start

echo -e "\n\nJAVA_HOME=/usr/lib/jvm/java-7-oracle" >> /etc/environment;

export JAVA_HOME=/usr/lib/jvm/java-7-oracle/ 

apt-get install -y apache2

rm -rf /var/www/html

ln -fs /vagrant /var/www/html

 
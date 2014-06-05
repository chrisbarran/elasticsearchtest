#!/usr/bin/env bash

wget -O - http://packages.elasticsearch.org/GPG-KEY-elasticsearch | sudo apt-key add -
 
echo "deb http://packages.elasticsearch.org/elasticsearch/1.0/debian stable main" | sudo tee -a /etc/apt/sources.list

echo "deb http://packages.elasticsearch.org/logstash/1.3/debian stable main" | sudo tee -a /etc/apt/sources.list

sudo apt-get update

export DEBIAN_FRONTEND=noninteractive

sudo apt-get -q -y install openjdk-7-jdk

sudo apt-get install elasticsearch

sudo update-rc.d elasticsearch defaults 95 10

sudo /etc/init.d/elasticsearch start
 
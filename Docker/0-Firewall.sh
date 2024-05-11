#!/bin/bash
# A sample Bash script, by Ryan

echo Hello World!


#Core.YAML
#Postgres DB
sudo ufw allow 5432

#Redis DB
sudo ufw allow 6379
sudo ufw allow 8001

#Rabbit MQ
sudo ufw allow 15672
sudo ufw allow 5672


#Grafana-Loki.YAML
#Loki
sudo ufw allow 3100

#Grafana
sudo ufw allow 3000

#Prometheus
sudo ufw allow 9090


#Seq.YAML
#Seq
sudo ufw allow 8003
sudo ufw allow 5341


#Kafka.YAML
#Zookeeper
sudo ufw allow 2181
sudo ufw allow 2888

#Kafka Node 1
sudo ufw allow 9092
sudo ufw allow 29092

#Kafka Node 2
sudo ufw allow 9093
sudo ufw allow 29093

#Kafka Node 3
sudo ufw allow 9094
sudo ufw allow 29094

#Kafka UI
sudo ufw allow 8080






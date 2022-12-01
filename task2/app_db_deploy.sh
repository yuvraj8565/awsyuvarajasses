#!/bin/bash
## This is a simple bash script for creating the APP and DB deployments
## Clone repo from Public Git
git clone https://github.com/yuvraj8565/awsyuvarajasses.git
kubectl apply -f awsyuvarajasses/task2/nginxdeploy
kubectl apply -f awsyuvarajasses/task2/dbdeploy

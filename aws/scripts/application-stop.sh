#!/bin/bash
set -x

# Kill the running JAR file
app_id=$(ps -ef | grep 'spring-petclinic-metrics.jar' | grep -v 'grep' | awk '{ printf $2 }')
sudo kill $app_id
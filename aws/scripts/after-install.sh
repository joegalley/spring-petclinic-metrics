#!/bin/bash
set -xe

# Copy JAR file from S3 bucket to EC2 instance
aws s3 cp s3://terraform-20221009151650560700000002/spring-petclinic-2.6.0.jar /usr/local/spring-petclinic-metrics.jar
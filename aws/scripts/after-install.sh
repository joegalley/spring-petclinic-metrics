#!/bin/bash
set -xe


# Copy war file from S3 bucket to tomcat webapp folder
aws s3 cp s3://observabilitydemostack-webappdeploymentbucket-18ocyoo6w7enz/app.war /usr/local/tomcat9/webapps/app.war


# Ensure the ownership permissions are correct.
chown -R tomcat:tomcat /usr/local/tomcat9/webapps

#!/bin/bash
set -xe


# Copy war file from S3 bucket to tomcat webapp folder
aws s3 cp s3://codedeploystack-webappdeploymentbucket-1g0sf1aq420y1/spring-petclinic-2.7.3.war /usr/local/tomcat9/webapps/SpringPetClinic.war


# Ensure the ownership permissions are correct.
chown -R tomcat:tomcat /usr/local/tomcat9/webapps
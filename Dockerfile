# FROM openjdk:12-jdk-alpine
#
# ENV APP_VERSION="2.6.0"
#
# COPY build/libs/spring-petclinic-${APP_VERSION}.jar spring-petclinic.jar
#
# CMD ["java","-jar","spring-petclinic.jar"]


FROM python:3.9-alpine
WORKDIR /<github-repo>
ENV  MSG="Hello World!"
COPY . .
RUN pip3 install -r requirement.txt
EXPOSE 5000
CMD [ "python3", "-m" , "flask", "run", "--host=0.0.0.0"]
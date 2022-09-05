FROM openjdk:12-jdk-alpine

ENV APP_VERSION="2.6.0"

COPY ./build/libs/spring-petclinic-${APP_VERSION}.jar spring-petclinic.jar

CMD ["java","-jar","spring-petclinic.jar"]

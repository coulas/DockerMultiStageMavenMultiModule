FROM maven:3.6-jdk-11 as dependencies

COPY pom.xml .

RUN mvn dependency:go-offline compile

FROM dependencies as build

RUN mvn package

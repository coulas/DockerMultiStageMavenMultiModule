FROM maven:3.6-jdk-11

WORKDIR /build
COPY pom.xml /build/
COPY domain/pom.xml /build/domain/
COPY inouts/pom.xml /build/inouts/

RUN mvn de.qaware.maven:go-offline-maven-plugin:resolve-dependencies
COPY . /build/
RUN mvn package
# then deploy to your external repository

FROM maven:3.6-jdk-11 as poms

WORKDIR /build
COPY . .
RUN mkdir -vp poms/ && find . -name pom.xml -exec cp -v --parents \{\} poms/ \;

FROM maven:3.6-jdk-11 as dependencies

WORKDIR /build
COPY --from=poms /build/poms/ .

RUN mvn dependency:go-offline compile

FROM dependencies as build

RUN mvn package

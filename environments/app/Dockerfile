FROM maven:3.8.5-openjdk-17-slim as builder
COPY pom.xml .
RUN mvn dependency:resolve dependency:resolve-plugins

COPY src/ src/
RUN mvn package

FROM openjdk:17-jdk-buster
WORKDIR /app
COPY --from=builder target/feedback-0.0.1-SNAPSHOT.jar app/

ENTRYPOINT ["java","-jar","app/feedback-0.0.1-SNAPSHOT.jar"]
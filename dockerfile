#
# Build Package
#
FROM maven:3.8.3-openjdk-17 AS build
COPY ./JBS-POC-master .
RUN mvn clean package -DskipTests

#
# Package stage
#
FROM openjdk:17-jdk-slim
COPY --from=build /target/JBS-POC-master-0.0.1-SNAPSHOT.jar JBS-POC-master.jar
EXPOSE 9192
ENTRYPOINT ["java","-jar","JBS-POC-master.jar"]
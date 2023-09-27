#
# Build Package
#
FROM maven:3.8.3-openjdk-17 AS build
COPY . .
RUN mvn clean package -DskipTests

#
# Package stage
#
FROM openjdk:17-jdk-slim
COPY --from=BUILD /target/JBS-POC-0.1.jar JBS.jar
EXPOSE 9190
ENTRYPOINT ["java","-jar","JBS.jar"]


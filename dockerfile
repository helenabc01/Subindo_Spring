#
# Build Package
#
FROM maven:3.8.3-openjdk-17 AS build
COPY ./PraticaDevops .
RUN mvn clean package -DskipTests

#
# Package stage
#
FROM openjdk:17-jdk-slim
COPY --from=build /target/PraticaDevops-0.0.1-SNAPSHOT.jar PraticaDevops.jar
EXPOSE 9192
ENTRYPOINT ["java","-jar","PraticaDevops.jar"]
# Build
FROM maven:3.9.2-eclipse-temurin-17 AS build
COPY src /home/app/src
COPY pom.xml /home/app
RUN mvn -f /home/app/pom.xml clean package

# Package
FROM openjdk:17
COPY --from=build /home/app/target/test1-1.0-SNAPSHOT.jar /usr/local/lib/test1.jar
EXPOSE 8080
ENTRYPOINT ["java", "-jar", "/usr/local/lib/test1.jar"]

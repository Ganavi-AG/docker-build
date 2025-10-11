FROM maven:3.8.6-eclipse-temurin-17 AS build
WORKDIR /app
copy pom.xml .
copy src ./src
RUN mvn clean package -DskipTests
FROM eclipse-temurin-17-jdk-alpine
workdir /app
copy --from=build /app/target/*.jar app.jar
ENTRYPOINT ["java", "-jar", "app.jar"]

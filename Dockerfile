FROM maven:3.8.6-eclipse-temurin
WORKDIR /app
copy Downloads/maven_calculator_app-main ./app
RUN mvn clean package
CMD ["mvn","clean","package"]

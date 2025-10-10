FROM maven:3.8.6-openjdk-17
WORKDIR /app
copy Downloads/maven_calculator_app-main ./app
RUN mvn clean package
CMD ["mvn","clean","package"]

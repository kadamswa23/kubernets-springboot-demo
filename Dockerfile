FROM maven:3.8.3-openjdk-17

WORKDIR /app

COPY .mvn/ ./mvn
COPY mvnw pom.xml ./

COPY src ./src
RUN mvn clean package -DskipTests

COPY from=build /target/demo-0.0.1-SNAPSHOT.jar .
CMD ["java", "-jar", "my-application.jar"]
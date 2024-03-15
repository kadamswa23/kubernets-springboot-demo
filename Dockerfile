FROM eclipse-temurin:17-jdk-focal
WORKDIR /app
COPY .mvn/ ./mvn
COPY mvnw pom.xml ./

COPY src ./src
RUN mvn clean package -DskipTests

COPY from=build /app/target/demo-0.0.1-SNAPSHOT.jar .
CMD ["java", "-jar", "my-application.jar"]
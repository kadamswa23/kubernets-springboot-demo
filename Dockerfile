FROM maven:3.8.3-openjdk-17

COPY .mvn/ ./mvn
COPY mvnw pom.xml ./

COPY src ./src
RUN mvn clean package -DskipTests

COPY target/*.jar spring-docker-app.jar

CMD ["java", "-jar", "spring-docker-app.jar"]
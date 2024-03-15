FROM maven:3.8.3-openjdk-17

WORKDIR /app

COPY .mvn/ ./mvn
COPY mvnw pom.xml ./

COPY src ./src
RUN mvn clean package -DskipTests

CMD ["./mvnw", "spring-boot:run"]
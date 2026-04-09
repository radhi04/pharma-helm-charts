FROM maven:3.9-eclipse-temurin-17 AS builder
WORKDIR /app
COPY pom.xml .

COPY src ./src
RUN mvn clean package -DskipTests -Dmaven.wagon.http.retryHandler.count=3

FROM eclipse-temurin:17-jre
WORKDIR /app
RUN groupadd -r pharma && useradd -r -g pharma pharma
COPY --from=builder /app/target/*.jar app.jar
USER pharma
EXPOSE 8082
ENTRYPOINT ["java", "-jar", "-Djava.security.egd=file:/dev/./urandom", "app.jar"]

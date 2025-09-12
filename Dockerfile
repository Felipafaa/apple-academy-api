# Estágio 1: Build com Maven e Java 21
FROM maven:3.9-eclipse-temurin-21 AS builder
WORKDIR /app
COPY . .
RUN mvn clean package -DskipTests

# Estágio 2: Execução com JRE 21 (<<--- AQUI ESTÁ A CORREÇÃO!)
FROM eclipse-temurin:21-jre
WORKDIR /app
COPY --from=builder /app/target/apple-academy-api-0.0.1-SNAPSHOT.jar ./app.jar
CMD ["java", "-jar", "app.jar"]
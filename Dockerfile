# 1. Build-Phase mit Java 25
FROM eclipse-temurin:25-jdk-jammy AS build
WORKDIR /app

# Kopiere alle Projektdateien
COPY . .

# WICHTIG: Mache den Wrapper ausführbar
RUN chmod +x ./gradlew

# WICHTIG: Nutze ./gradlew anstatt gradle!
RUN ./gradlew build --no-daemon -x test

# 2. Runtime-Phase
FROM eclipse-temurin:25-jre-jammy
WORKDIR /app

# Port freigeben
EXPOSE 8080

# Kopiere das fertige JAR aus der Build-Phase
COPY --from=build /app/build/libs/studyhub-0.0.1-SNAPSHOT.jar app.jar

# Starte das Backend
ENTRYPOINT ["java", "-jar", "app.jar"]
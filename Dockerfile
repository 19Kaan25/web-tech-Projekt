FROM eclipse-temurin:25-jdk-jammy AS build
COPY --chown=gradle:gradle . /home/gradle/src
WORKDIR /home/gradle/src
RUN gradle build --no-daemon

FROM eclipse-temurin:25-jre-jammy
COPY --from=build /home/gradle/src/build/libs/studyhub-0.0.1-SNAPSHOT.jar app.jar
ENTRYPOINT ["java","-jar","/app.jar"]
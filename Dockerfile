FROM sbtscala/scala-sbt:eclipse-temurin-alpine-22_36_1.9.9_3.4.1 AS builder
WORKDIR /app
COPY . /app
RUN sbt assembly

FROM eclipse-temurin:22
COPY --from=builder /app/web/target/scala-2.13/web-assembly-0.1.0-SNAPSHOT.jar restic-browser.jar
ENTRYPOINT ["java", "-jar", "restic-browser.jar"]
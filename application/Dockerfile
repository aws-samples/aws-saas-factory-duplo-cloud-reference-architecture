FROM --platform=linux/amd64 maven:3.8.3-amazoncorretto-17 as BUILD

COPY . /usr/src/application
RUN mvn -Dmaven.repo.local=/root/m2 --batch-mode -f /usr/src/application/pom.xml clean package

#FROM openjdk:17.0.1-jdk-slim
FROM --platform=linux/amd64 amd64/amazoncorretto:17-alpine-jdk
EXPOSE 80
COPY --from=BUILD /usr/src/application/target /opt/target
WORKDIR /opt/target

CMD ["java", "-jar", "application-1.0.jar"]

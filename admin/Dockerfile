FROM --platform=linux/amd64 maven:3.8.3-amazoncorretto-17 as BUILD

COPY . /usr/src/admin
RUN mvn -Dmaven.repo.local=/root/m2 --batch-mode -f /usr/src/admin/pom.xml clean package

FROM --platform=linux/amd64 amd64/amazoncorretto:17-alpine-jdk
EXPOSE 80
COPY --from=BUILD /usr/src/admin/target /opt/target
WORKDIR /opt/target

CMD ["java", "-jar", "admin-1.0.jar"]

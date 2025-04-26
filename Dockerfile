FROM amazoncorretto:21-alpine3.21

WORKDIR /app
COPY com.example/app/*.java ./app/
RUN javac app/*.java

# Run the Main class (no package prefix since it's just 'app')
CMD ["java", "app.Main"]
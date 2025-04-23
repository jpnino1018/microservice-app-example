# Use OpenJDK 8
FROM openjdk:8-jdk-alpine

# Set working directory
WORKDIR /app

# Copy Maven Wrapper files
COPY .mvn .mvn
COPY mvnw /app/mvnw
COPY pom.xml /app/pom.xml

# Debug: Check if mvnw exists
RUN ls -l /app

# Convert mvnw to Unix format and make it executable
RUN apk add --no-cache dos2unix && dos2unix /app/mvnw
RUN chmod +x /app/mvnw

# Copy source code
COPY src /app/src

# Build the application
RUN /app/mvnw clean package

# Expose port 8083
EXPOSE 8083

# Run the app
CMD ["java", "-jar", "target/users-api-0.0.1-SNAPSHOT.jar"]

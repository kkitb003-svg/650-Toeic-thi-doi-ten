# Multi-stage build for Token Ring distributed system
FROM eclipse-temurin:11-jdk as builder

WORKDIR /app

# Download MySQL JDBC driver
RUN apt-get update && apt-get install -y wget && \
    mkdir -p /app/lib && \
    wget -O /app/lib/mysql-connector-java-8.0.33.jar https://repo1.maven.org/maven2/mysql/mysql-connector-java/8.0.33/mysql-connector-java-8.0.33.jar

# Copy source code
COPY src/ src/
COPY build/ build/

# Compile Java files with MySQL driver in classpath
RUN find src -name "*.java" -type f | xargs javac -cp build:/app/lib/* -d build

# Runtime stage
FROM eclipse-temurin:11-jre

WORKDIR /app

# Copy compiled classes from builder
COPY --from=builder /app/build build/
COPY --from=builder /app/src src/
COPY --from=builder /app/lib lib/

# Expose port
EXPOSE 8080

# Set default port
ENV PORT=8080

# Run server with MySQL driver in classpath
CMD ["java", "-cp", "build:lib/*", "server.Main"]

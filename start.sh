#!/bin/bash

# Token Ring 6 Servers - Start Script
# Reads environment variables and starts the server

# Get environment variables with defaults
NODE_ID=${NODE_ID:-1}
PORT=${PORT:-8080}
MYSQL_URL=${MYSQL_URL:-"jdbc:mysql://localhost:3306/db1"}
PEERS=${PEERS:-""}

echo "=========================================="
echo "Token Ring Server Startup"
echo "=========================================="
echo "[INFO] NODE_ID: $NODE_ID"
echo "[INFO] PORT: $PORT"
echo "[INFO] MYSQL_URL: $MYSQL_URL"
echo "[INFO] PEERS: ${PEERS:-'(will be set by PM later)'}"
echo "=========================================="

# Compile Java files if not already compiled
if [ ! -d "build/server" ] || [ -z "$(find src/server -name '*.java' -newer build/server -type f 2>/dev/null)" ]; then
    echo "[COMPILE] Compiling Java files..."
    
    # Download MySQL driver if not present
    if [ ! -f "lib/mysql-connector-java-8.0.33.jar" ]; then
        echo "[DOWNLOAD] Downloading MySQL JDBC driver..."
        mkdir -p lib
        cd lib
        wget -q https://repo1.maven.org/maven2/mysql/mysql-connector-java/8.0.33/mysql-connector-java-8.0.33.jar
        cd ..
    fi
    
    # Compile with MySQL driver in classpath
    javac -cp build:lib/mysql-connector-java-8.0.33.jar -d build src/server/*.java src/client/*.java 2>&1
    if [ $? -ne 0 ]; then
        echo "[ERROR] Compilation failed!"
        exit 1
    fi
    echo "[COMPILE] Done!"
else
    echo "[COMPILE] Already compiled, skipping..."
fi

# Run the server with environment variables
echo "[START] Starting server..."
export NODE_ID PORT MYSQL_URL PEERS
java -cp build:lib/mysql-connector-java-8.0.33.jar server.Main

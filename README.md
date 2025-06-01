# Nginx Learning Project

This project is designed to explore and demonstrate various features of Nginx, focusing on its capabilities as a high-performance web server, reverse proxy, and load balancer. The project includes multiple examples showcasing different Nginx configurations and integrations.

## Features

### 1. Load Balancing
- **Round-Robin Load Balancing**: Configured Nginx to distribute incoming requests across multiple backend servers.
- **Backend Server Management**: Easy to add or remove backend servers from the load balancing pool.

### 2. WebSocket Support
- **Real-time Messaging**: Implemented a WebSocket-based chat application.
- **STOMP Protocol**: Utilized STOMP over WebSockets for message passing.
- **Spring Boot Backend**: Java/Spring Boot application handling WebSocket connections.

### 3. Reverse Proxy
- **Request Routing**: Nginx acts as a reverse proxy for backend applications.
- **WebSocket Proxying**: Properly configured to handle WebSocket connections and upgrade headers.

### 4. Multi-Site Hosting
- **Multiple Websites**: Configured Nginx to serve different content based on URL paths.
- **Static File Serving**: Example of serving static HTML files from different directories.

### 5. Custom Java HTTP Server
- **Lightweight Server**: Simple Java HTTP server implementation.
- **Dynamic Responses**: Returns host-specific responses for load balancing demonstration.

## Project Structure

```
Nginx-Project/
├── com.example/                     # Example applications
│   ├── app/                         # Custom Java HTTP server
│   │   ├── Main.java               # Server entry point
│   │   └── GetHandler.java         # Request handler
│   ├── webserver/                  # Nginx configuration examples
│   │   ├── nginx.conf             # Multi-site configuration
│   │   └── html/                  # Static website content
│   │       ├── index.html         # Main page
│   │       ├── site1/             # Site 1 content
│   │       ├── site2/             # Site 2 content
│   │       └── site3/             # Site 3 content
├── messaging-websocket/            # WebSocket demo application
│   ├── src/
│   │   ├── main/
│   │   │   ├── java/com/example/messaging_websocket/
│   │   │   │   ├── WebSocketConfig.java  # WebSocket configuration
│   │   │   │   └── HelloMessage.java     # Message model
│   │   │   └── resources/static/
│   │   │       ├── index.html    # Frontend interface
│   │   │       ├── app.js        # Client-side WebSocket logic
│   │   │       └── main.css      # Styling
├── nginx.conf                # Main Nginx configuration
└── Dockerfile                # Docker configuration for Nginx
```

## Prerequisites

- Docker and Docker Compose
- Java 8 or higher (for the WebSocket and custom HTTP server applications)
- Nginx (or run via Docker)

## Getting Started

### 1. Clone the Repository

```bash
git clone <repository-url>
cd Nginx-Project
```

### 2. Run the Custom Java HTTP Server

1. Compile and run the server:
   ```bash
   cd com.example/app
   javac *.java
   java Main
   ```

2. Access the server at: `http://localhost:8080`

### 3. Run the Multi-Site Nginx Server

1. Start Nginx with the example configuration:
   ```bash
   cd com.example/webserver
   docker run -p 8080:80 -v $(pwd)/html:/usr/share/nginx/html -v $(pwd)/nginx.conf:/etc/nginx/nginx.conf:ro nginx
   ```

2. Access different sites at:
   - Main site: `http://localhost:8080`
   - Site 1: `http://localhost:8080/site1`
   - Site 2: `http://localhost:8080/site2`
   - Site 3: `http://localhost:8080/site3`

### 4. Build and Run with Docker (Complete Setup)

1. Build the Docker image:
   ```bash
   docker-compose build
   ```

2. Start the services:
   ```bash
   docker-compose up -d
   ```

3. Access the application at: `http://localhost:8080`

## Nginx Configuration Highlights

### Load Balancing Configuration
```nginx
upstream backend {
    server javaapp1:8080;
    server javaapp2:8080;
    server javaapp3:8080;
}
```

### Multi-Site Configuration
```nginx
server {
    listen 8080;
    root /usr/share/nginx/html;
    index index.html;

    location /site1 {
        try_files $uri /site1/site1.html;
    }

    
    location /site2 {
        try_files $uri /site2/site2.html;
    }
    
    location /site3 {
        try_files $uri /site3/site3.html;
    }
}
```

### WebSocket Proxy Configuration
```nginx
location /ws {
    proxy_pass http://backend;
    proxy_http_version 1.1;
    proxy_set_header Upgrade $http_upgrade;
    proxy_set_header Connection "upgrade";
    proxy_set_header Host $host;
}
```

## Testing the Application

1. **Load Balancing Test**:
   - Start multiple instances of the Java HTTP server on different ports
   - Configure Nginx to load balance between them
   - Observe how requests are distributed

2. **Multi-Site Test**:
   - Access different site paths to see different content
   - Add or modify content in the html directories

3. **WebSocket Test**:
   - Open the application in multiple browser windows
   - Connect using the "Connect" button
   - Send messages between different sessions to see real-time updates

## Learning Resources

- [Nginx Documentation](https://nginx.org/en/docs/)
- [WebSocket Module](https://nginx.org/en/docs/http/websocket.html)
- [Load Balancing](https://docs.nginx.com/nginx/admin-guide/load-balancer/tcp-udp-load-balancer/)
- [Java HTTP Server](https://docs.oracle.com/javase/8/docs/jre/api/net/httpserver/spec/)

## License

This project is open source and available under the [MIT License](LICENSE).

## Acknowledgments

- Built with Spring Boot, Java HTTP Server, and Nginx
- Inspired by various Nginx tutorials and documentation

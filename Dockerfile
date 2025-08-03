# Dockerfile untuk Hyperlane Relayer
FROM node:18-alpine

# Install dependencies yang diperlukan
RUN apk add --no-cache git python3 make g++

# Set working directory
WORKDIR /app

# Install Hyperlane CLI secara global
RUN npm install -g @hyperlane-xyz/cli

# Copy konfigurasi dan chain data
COPY chains/ ./chains/
COPY configs/ ./configs/
COPY deployments/ ./deployments/
COPY relayer-cache.json ./relayer-cache.json

# Create start script
COPY start.sh /start.sh
RUN chmod +x /start.sh

# Expose port (optional, untuk monitoring)
EXPOSE 3000

# Start the relayer
CMD ["/start.sh"]

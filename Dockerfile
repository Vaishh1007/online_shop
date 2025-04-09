# Stage 1 - Development

FROM node:18 AS builder

# Set a working directory for stage 1
WORKDIR /app

# Copy
COPY . .

# Install packages 
RUN npm install

# Expose port
EXPOSE 5173

# Serve the application
CMD ["npm", "run", "dev"]
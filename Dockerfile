# Stage 1 - Base iamge to build application using npm

FROM node:18 AS builder

# Set a working directory
WORKDIR /app

# Copy 
COPY package*.json ./

# Install project dependencies
RUN npm install

# Copy the rest of the application source code into the container
COPY . .


# Stage 1 - Base iamge to build RUN Application (small image)

# Use light-weight image for running the app
FROM node:18-alpine 

# Set working directory
WORKDIR /app

# Copy from stage1
COPY --from=builder /app .

# Expose the port
EXPOSE 5173

# Command to run the application
CMD ["npm", "run",  "dev"]
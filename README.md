# Online Shop – Hackathon Phase 1 Submission

Welcome to the **Online Shop** project! This is a modern e-commerce platform built using **Vite**, **Node.js**, and **Docker**.

---

## 📜 Features

- 🛒 E-commerce platform -
A fully functional online shopping experience with product listings, cart, and checkout capabilities.
- ⚡ Built with Vite for fast development -
Uses Vite as the build tool for lightning-fast startup, hot module replacement, and optimized builds.
- 🐳 Dockerized using a **Distroless** image for enhanced security & performance -
Containerized with a minimal, secure Distroless image for improved performance and reduced attack surface.
- 🌐 Exposed on **port 5173** for deployment on servers -
Configured to run on port 5173, making it easy to serve in development or production environments.
- 🔄 Supports **Volumes** & **Networks** for easy container management -
Leverages Docker volumes and networks to persist data and simplify service communication during deployment.

---

## Getting Started

### 1️⃣ Prerequisites

Make sure the following are installed on your system:

- [Docker](https://docs.docker.com/get-docker/) – for containerized setup  
- [Node.js (v16+)](https://nodejs.org/) – if running locally  
- [Git](https://git-scm.com/) – for cloning the repository

---

### 2️⃣ Clone the Repository

```bash
git clone https://github.com/vaishh1007/online_shop.git
ls
cd online_shop
```

---

## 🛠 Creating the Dockerfile for the Project

### 🔧 Stage 1 - Development Dockerfile

```Dockerfile
FROM node:18 AS builder

# Set working directory
WORKDIR /app

# Copy only package files first to optimize caching
COPY package*.json ./
RUN npm install

# Copy all files
COPY . .

# Expose port
EXPOSE 5173

# Run the application in dev mode
CMD ["npm", "run", "dev"]
```

---

## 🧱 Multi-stage Dockerfile

```Dockerfile
# Stage 1 - Builder
FROM node:18 AS builder

WORKDIR /app

# Copy package files and install dependencies
COPY package*.json ./
RUN npm install

# Copy the full project
COPY . .

# Stage 2 - Production
FROM gcr.io/distroless/nodejs18-debian12

# Set working directory
WORKDIR /app

# Copy built app from builder
COPY --from=builder /app .

# Expose the app port
EXPOSE 5173

# Run the application
CMD ["npm", "run", "start"]
```

---

## 🐳 Build and Run with Docker

### 3️⃣ Build and Run the Container

#### ✅ Step 1: Build the Docker Image

```bash
docker build -t online_shop:latest .
```

#### 📋 Step 2: List All Docker Images

```bash
docker images
```

#### 🔍 Step 3: Scan the Image Using Docker Scout

```bash
docker scout quickview online_shop
```

#### 🌐 Step 4: Create a Docker Network

```bash
docker network create my-net
```

#### ▶️ Step 5: Run the Container

```bash
docker run -d \
  --name online_shop \
  -p 5173:5173 \
  --network my-net \
  -v /home/ubuntu/volume/online_shop:/app/db \
  online_shop:latest
```

---

### 4️⃣ Verify Container is Running

Make sure your container appears in the list:

```bash
docker ps
```

You should see a container named `online_shop` running and bound to port `5173`.

---

### 5️⃣ Access the Application

Open your browser and go to:  
👉 [http://localhost:5173](http://localhost:5173)

---

## 🙌 Happy Hacking!

Built with ❤️ for the Hackathon.

---

**Author:** [@vaishh1007](https://github.com/vaishh1007)  
**Repository:** [Online Shop on GitHub](https://github.com/vaishh1007/online_shop)

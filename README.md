# Online Shop – Hackathon Phase 1 Submission

Welcome to the **Online Shop** project! This is a modern e-commerce platform built using **Vite, Node.js, and Docker**.

## 📜 Features
- 🛒 E-commerce platform
- ⚡ Built with **Vite** for fast development
- 🐳 **Dockerized** using a **Distroless image** for security & performance
- 📡 Exposed on **port 5173** for deploy on server
- 🔄 Supports **Volumes & Networks** for easy management 

---

## 🚀 Getting Started

### **1️⃣ Prerequisites**
Ensure you have the following installed:
- **Docker** (for containerized setup)
- **Node.js v16+** (if running locally)
- **Git** (for cloning the repository)

---

### **2️⃣ Clone the Repository**
```sh
git clone https://github.com/vaishh1007/online_shop.git
ls
cd online_shop
```

---

## 🛠 Creating the Dockerfile for our project

Before building the Docker image, create a `Dockerfile` 

### Stage 1 - Development

FROM node:18 AS builder

### Set a working directory for stage 1
WORKDIR /app

### Copy
COPY . .

### Install packages 
RUN npm install

### Expose port
EXPOSE 5173

### Serve the application
CMD ["npm", "run", "dev"]

## Multi-stage Dockerfile

### Stage 1 - Development

FROM node:18 AS builder

### Set a working directory for stage 1
WORKDIR /app

### Copy packages
COPY package*.json ./

### Install packages
RUN npm install

### Copy all
COPY . .


### Stage 2 - Production

FROM gcr.io/distroless/nodejs18-debian12

##3 Make a working directory for stage 2
WORKDIR /app

### Copy from stage 1
COPY --from=builder /app .

### Expose port
EXPOSE 5173

### Serve the application
CMD ["npm", "run", "dev"]

## 🐳 build an image & Running with Docker

### **3️⃣ Build and Run the Container**

#### **Step 1: Build the Docker Image**
```sh
docker build -t online_shop:latest .
```

#### **Step 2: List All Docker Images**
```sh
docker images 
```

#### **Step 3: Scan the Image Using Docker Scout**
```sh
docker scout quickview online_shop
```

#### **Step 4: Create a Docker Network**
```sh
docker network create my-net
```

#### **Step 5: Run the Container**
```sh
docker run -d \  --name online_shop \ -p 5173:5173 \ --network my-net \ -v <path of your volume>:/app/db \  online_shop:latest
```

#### **Step 6: Check Running Containers**
```sh
docker ps
```

### **4️⃣ Verify if the Container is Running**
```sh
docker ps
```
You should see your **online_shop** container running on **port 5173**.

### **5️⃣ Access the Application**
Open your browser and visit:
👉 **http://localhost:5173**

---
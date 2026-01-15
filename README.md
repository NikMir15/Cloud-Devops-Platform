# Cloud DevOps Platform 🚀

A production-style **Cloud / DevOps starter project** demonstrating how to containerize a backend application and expose it securely using **Docker, Docker Compose, and Nginx reverse proxy**.

This project is built step by step with DevOps best practices and is designed to be extended further with **CI/CD and AWS infrastructure (Terraform + EC2)**.

---

## 🧱 Architecture Overview

Client (Browser / curl)
|
v
Nginx (Port 8081)
|
v
Flask App (Port 5000, internal Docker network)

markdown
Copy code

- **Nginx** acts as a reverse proxy
- **Flask app** runs inside a Docker container
- Only Nginx is exposed to the host
- Flask remains private inside the Docker network

---

## 🛠️ Tech Stack

- **Backend:** Python (Flask)
- **Containerization:** Docker
- **Container Orchestration:** Docker Compose
- **Reverse Proxy:** Nginx
- **Version Control:** Git & GitHub
- **OS:** Ubuntu (Linux)

---

## 📂 Project Structure

cloud-devops-platform/
├── app/
│ ├── app.py
│ ├── requirements.txt
│ ├── Dockerfile
│ └── wsgi.py
├── nginx/
│ └── nginx.conf
├── docker-compose.yml
├── .gitignore
└── README.md

yaml
Copy code

---

## ⚙️ Application Features

- `/` → Home endpoint
- `/health` → Health check endpoint (used in DevOps monitoring & load balancers)
- Containerized Flask application
- Nginx reverse proxy routing traffic to Flask
- Clean separation between public and internal services

---

## ▶️ Run Locally (Docker + Nginx)

### Prerequisites
Make sure you have installed:
- Docker
- Docker Compose

Check:
```bash
docker --version
docker-compose --version
Start the application
From the project root:

bash
Copy code
docker-compose up --build
Access the application
Via Nginx (recommended):

http://localhost:8081

http://localhost:8081/health

Stop the application
bash
Copy code
Ctrl + C
docker-compose down
🧪 Verify Using curl
bash
Copy code
curl http://localhost:8081/
curl http://localhost:8081/health
Expected output:

Home page text: Cloud DevOps Platform is running ✅

Health endpoint JSON: { "status": "ok" }


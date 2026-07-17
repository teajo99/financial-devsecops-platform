# Financial DevSecOps Platform

![AWS](https://img.shields.io/badge/AWS-Cloud-orange?logo=amazonaws&logoColor=white)
![Terraform](https://img.shields.io/badge/Terraform-Infrastructure%20as%20Code-623CE4?logo=terraform&logoColor=white)
![Docker](https://img.shields.io/badge/Docker-Containerization-2496ED?logo=docker&logoColor=white)
![Kubernetes](https://img.shields.io/badge/Kubernetes-Orchestration-326CE5?logo=kubernetes&logoColor=white)
![GitLab CI](https://img.shields.io/badge/GitLab-CI%2FCD-FCA121?logo=gitlab&logoColor=white)
![Trivy](https://img.shields.io/badge/Security-Trivy-1904DA?logo=aqua&logoColor=white)
![Prometheus](https://img.shields.io/badge/Monitoring-Prometheus-E6522C?logo=prometheus&logoColor=white)
![Grafana](https://img.shields.io/badge/Dashboard-Grafana-F46800?logo=grafana&logoColor=white)
![Linux](https://img.shields.io/badge/Linux-Server-FCC624?logo=linux&logoColor=black)

## Cloud-Native Financial Application Platform Built with AWS, Terraform, Docker, Kubernetes, GitLab CI/CD and Security Automation

---

# Project Overview

The Financial DevSecOps Platform is a cloud-native application delivery platform designed to demonstrate how modern financial systems can be built, secured, deployed, and monitored using industry-standard DevOps and cloud engineering practices.

The project simulates a real-world financial organisation that requires a secure, scalable, and highly available application platform while maintaining strong security controls and operational visibility.

The objective was to design an end-to-end DevSecOps solution that automates infrastructure provisioning, application delivery, security testing, container management, Kubernetes deployment, and monitoring.

---

# Why I Created This Project

Financial organisations handle highly sensitive customer and transaction data and require technology platforms that are:

- Secure against cyber threats
- Highly available
- Scalable during demand changes
- Consistent across environments
- Auditable and controlled
- Rapidly deployable without sacrificing security

Traditional application deployment processes often involve manual infrastructure setup, manual security checks, and slow release cycles.

I created this project to demonstrate how DevOps and cloud engineering practices can solve these challenges by building an automated, secure, and repeatable deployment platform.

---

# Business Problem

A financial company needs to deliver applications quickly while meeting strict security and reliability expectations.

The business challenges were:

## 1. Slow and Manual Infrastructure Deployment

Manual cloud infrastructure creation causes:

- Human errors
- Inconsistent environments
- Longer delivery times
- Difficult disaster recovery processes

## Solution

Implemented Infrastructure as Code using Terraform.

Terraform automatically provisions:

- AWS networking
- VPC infrastructure
- Kubernetes cluster
- Worker nodes
- Security configurations

This creates a repeatable and controlled cloud environment.

---

## 2. Security Risks During Application Delivery

Applications can introduce vulnerabilities if security testing is performed only after deployment.

Risks include:

- Vulnerable container images
- Misconfigured infrastructure
- Exposed secrets
- Unsafe dependencies

## Solution

Integrated security scanning into the CI/CD pipeline using Trivy.

Security checks are performed automatically before application delivery.

The pipeline scans:

- Infrastructure configuration
- Container images
- Application dependencies

This shifts security left and identifies issues earlier in the development lifecycle.

---

## 3. Inconsistent Application Deployment

Manual application deployment creates differences between environments and increases deployment failures.

## Solution

Containerised the application using Docker.

Benefits:

- Consistent runtime environment
- Portable application delivery
- Easier scaling
- Faster deployments

The Docker image is stored securely in Amazon Elastic Container Registry (ECR).

---

## 4. Application Scalability and Availability

Financial applications must remain available even during increased demand or infrastructure failures.

## Solution

Deployed the application on Amazon Elastic Kubernetes Service (EKS).

Kubernetes provides:

- Container orchestration
- Automatic scheduling
- Self-healing workloads
- Horizontal scaling capability
- Rolling updates

---

## 5. Lack of Operational Visibility

Without monitoring, engineering teams cannot easily detect:

- Application failures
- Resource exhaustion
- Performance problems

## Solution

Implemented monitoring using:

- Prometheus
- Grafana
- Kubernetes metrics

This provides visibility into:

- Cluster health
- Application performance
- Resource utilisation
- Infrastructure status

---

# Solution Architecture

![image alt](https://github.com/teajo99/financial-devsecops-platform/blob/1defb5b21babb877aa47bc56187e261b524f84b1/Devsecops%20Diagram.gif)

# Technologies Used

## Cloud Platform

- Amazon Web Services (AWS)

Services:

- Amazon VPC
- Amazon EKS
- Amazon ECR
- IAM
- EC2

---

## Infrastructure

- Terraform

Used for:

- Infrastructure provisioning
- Environment consistency
- Repeatable deployments

---

## Containerisation

- Docker

Used for:

- Application packaging
- Image creation
- Consistent application runtime

---

## Kubernetes

- Amazon EKS
- Kubernetes Deployments
- Kubernetes Services
- Kubernetes Pods

Used for:

- Container orchestration
- Application availability
- Scaling

---

## CI/CD

- GitLab CI/CD

Pipeline stages:


Build - Security Scan - Push Image- Deploy


---

## Security

- Trivy

Used for:

- Vulnerability scanning
- Infrastructure scanning
- Container security checks

---

## Monitoring

- Prometheus
- Grafana
- Helm

Used for:

- Metrics collection
- Dashboards
- Operational monitoring

---

# Implementation Approach

## Step 1 - Infrastructure Provisioning

Created AWS infrastructure using Terraform.

Provisioned:

- VPC
- Networking components
- EKS cluster
- Worker nodes
- ECR repository

Terraform provided:

- Version controlled infrastructure
- Repeatable environments
- Reduced manual configuration

---

## Step 2 - Application Containerisation

Created Docker configuration:


app/

─ app.py
─ Dockerfile
─ requirements.txt


Built application container:


financial-api


The image was stored in:


Amazon Elastic Container Registry (ECR)


---

## Step 3 - CI/CD Automation

Created GitLab pipeline automation.

The pipeline performs:

### Build

Creates Docker image.

### Security

Runs Trivy security checks.

### Push

Uploads the image to Amazon ECR.

### Deployment

Updates the Kubernetes application deployment.

---

## Step 4 - Kubernetes Deployment

Deployed application workloads to Amazon EKS.

Verified:


kubectl get nodes

kubectl get pods


The application successfully runs across Kubernetes worker nodes.

---

## Step 5 - Monitoring Implementation

Installed monitoring stack using Helm.

Implemented:

- Prometheus metrics collection
- Grafana dashboards
- Kubernetes monitoring

This enables engineers to monitor application and infrastructure health.

---

# Challenges Faced and How I Solved Them

## Challenge 1: Git Repository Push Failure

### Problem

Large Terraform provider files exceeded GitLab file limits.

Error:


blob exceeds the 100MB limit


### Cause

Terraform generated files were accidentally committed.

### Solution

Removed generated Terraform files from Git history using:


git filter-repo


Added `.gitignore` rules:


.terraform/
*.tfstate
*.tfstate.backup


---

# Challenge 2: Docker Build Issues

### Problem

Docker build commands failed because the correct build context was not provided.

### Solution

Corrected Docker build commands:


docker build -t financial-api app/


---

# Challenge 3: Kubernetes Image Pull Failure

### Problem

Kubernetes returned:


ErrImagePull


### Cause

The deployment referenced an incorrect Docker image tag.

### Solution

Updated Kubernetes deployment with the correct ECR image:


942909610648.dkr.ecr.eu-west-2.amazonaws.com/financial-api:<tag>


---

# Challenge 4: GitLab CI/CD Configuration Problems

### Problem

Pipeline failures caused by:

- Invalid YAML formatting
- Incorrect indentation
- Docker environment conflicts

### Solution

Rebuilt pipeline configuration and separated responsibilities between:

- Build
- Security
- Image publishing
- Deployment

---

# Challenge 5: AWS CLI and Docker Environment Issues

### Problem

Installing AWS CLI inside Alpine Docker images caused compatibility errors.

Example:


ImportError: pyexpat


### Cause

Python package compatibility issues.

### Solution

Adjusted CI/CD container strategy by using compatible AWS tooling images instead of installing AWS CLI dynamically.

---

# Project Results

The completed platform demonstrates:

- Automated cloud infrastructure provisioning  
- Containerised application delivery  
- Secure image management  
- Kubernetes orchestration  
- CI/CD automation  
- Security scanning integration  
- Monitoring and observability  

---

# Skills Demonstrated

This project demonstrates practical experience with:

- Cloud Engineering
- DevOps Engineering
- AWS Architecture
- Kubernetes Administration
- Infrastructure as Code
- CI/CD Automation
- Container Security
- Linux Administration
- Cloud Monitoring
- Troubleshooting Production-Style Systems

---

# Future Improvements

Potential enhancements:

- Implement GitOps using ArgoCD
- Add automated testing stages
- Use AWS IAM Roles instead of static credentials
- Integrate AWS Secrets Manager
- Add Kubernetes Network Policies
- Implement blue/green deployments
- Add centralized logging with AWS CloudWatch

---

# Final Summary

This project represents an end-to-end DevSecOps implementation for a financial application platform.

The solution demonstrates how modern engineering teams can combine cloud infrastructure, automation, security practices, and monitoring to deliver reliable and secure applications at scale.

The project was built to reflect real-world enterprise requirements and demonstrate practical skills required for a Cloud Engineer / DevOps Engineer role.

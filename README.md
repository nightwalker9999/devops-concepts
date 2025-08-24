# 🚀 DevOps Learning Tracker

## 📊 Overall Progress
![Overall Progress](https://img.shields.io/badge/Overall_Progress-20%25-blue?style=for-the-badge)

---

## 🛠️ Skill Dashboard

<!-- Core strengths -->
![Jenkins CI/CD](https://img.shields.io/badge/Jenkins_CI%2FCD-5%2F5-brightgreen?style=for-the-badge&logo=jenkins) 
![Monitoring](https://img.shields.io/badge/Monitoring_(Prom%2FGrafana%2FKibana)-4%2F5-green?style=for-the-badge&logo=grafana)
![Python](https://img.shields.io/badge/Python%2FBash-4%2F5-green?style=for-the-badge&logo=python)

<!-- Platforms & messaging -->
![Docker](https://img.shields.io/badge/Docker%20%26%20Compose-3%2F5-yellowgreen?style=for-the-badge&logo=docker)
![LocalStack](https://img.shields.io/badge/LocalStack-4%2F5-green?style=for-the-badge)
![SNS/SQS](https://img.shields.io/badge/SNS%2FSQS-3%2F5-yellowgreen?style=for-the-badge&logo=amazon-aws)

<!-- Data & IaC -->
![MySQL Wiring](https://img.shields.io/badge/MySQL_Wiring-3%2F5-yellowgreen?style=for-the-badge&logo=mysql)
![Terraform](https://img.shields.io/badge/Terraform-2%2F5-yellow?style=for-the-badge&logo=terraform)
![Kubernetes/Helm](https://img.shields.io/badge/Kubernetes%2FHelm-2%2F5-yellow?style=for-the-badge&logo=kubernetes)
![Cloud Arch](https://img.shields.io/badge/Cloud_Architecture-2%2F5-yellow?style=for-the-badge&logo=amazon-aws)
![Security](https://img.shields.io/badge/Security_%26_Compliance-1%2F5-orange?style=for-the-badge)

---

## ✅ Milestones

- [x] Docker Compose project structure created  
- [x] LocalStack running with SNS + SQS  
- [x] Queue policy set (SNS → SQS works)  
- [x] Worker container consuming messages  
- [x] MySQL schema created & inserts verified  
- [ ] End-to-end flow documented fully in README  
- [ ] Terraform VPC + EC2 basics  
- [ ] Jenkins CI/CD pipeline setup  
- [ ] Kubernetes manifests + Helm packaging  

---

## 🗓️ Weekly Check-In

![Week 1 Docker](https://img.shields.io/badge/Week_1-Docker_Foundations-success?style=flat-square)  
![Week 2 Jenkins](https://img.shields.io/badge/Week_2-Jenkins_CI%2FCD-success?style=flat-square)  
![Week 3 Terraform](https://img.shields.io/badge/Week_3-Terraform_Basics-in_progress?style=flat-square)  
![Week 4 SNS/SQS](https://img.shields.io/badge/Week_4-SNS%2FSQS-in_progress?style=flat-square)  
![Week 5 K8s](https://img.shields.io/badge/Week_5-K8s_Manifests-pending?style=flat-square)  

---

---

# 🎯 12-Week Gap-Closing Roadmap

This plan focuses on **Terraform + Kubernetes + Security** (your growth areas), while keeping Jenkins/Monitoring light since you’re already strong.  
Update the ✅ / ⏳ / ⬜ markers weekly.

---

## Week 1–2: Terraform Foundations
- [ ] Create `tf-vpc-ec2` repo (VPC, subnets, route tables, IGW).  
- [ ] Add EC2 instance with SG → output public IP.  
- [ ] Refactor into modules (`vpc`, `compute`).  
- [ ] Configure remote state (S3 + DynamoDB).  
- [ ] Test: `terraform init → apply → ssh → destroy`.  
- ✅ Skill bar impact: **Terraform 2/5 → 3/5**.

---

## Week 3–4: Terraform + Messaging
- [ ] `tf-sns-sqs` repo: create topic + queue.  
- [ ] Subscribe queue to topic with IAM policy.  
- [ ] Add Python producer/consumer with boto3.  
- [ ] Convert into module `messaging`.  
- ✅ Skill bar impact: **Terraform 3/5 → 4/5, SNS/SQS 3/5 → 4/5**.

---

## Week 5–6: Kubernetes Manifests
- [ ] Kind/Minikube cluster. Repo `k8s-flask`.  
- [ ] Write Deployment + Service.  
- [ ] Add ConfigMap/Secret → env vars.  
- [ ] Add liveness/readiness probes.  
- [ ] Rolling update + rollback demo.  
- ✅ Skill bar impact: **Kubernetes 2/5 → 3.5/5**.

---

## Week 7: Helm Packaging
- [ ] Create `flask-chart` with `helm create`.  
- [ ] Move manifests into templates.  
- [ ] values.yaml → image/tag/replicas.  
- [ ] `helm install --dry-run` + upgrade demo.  
- ✅ Skill bar impact: **Kubernetes/Helm 3.5/5 → 4/5**.

---

## Week 8–9: Security Basics
- [ ] Add Trivy scan stage in Jenkins pipeline (fail on HIGH).  
- [ ] Run Trivy scan on Docker image + repo filesystem.  
- [ ] Add non-root user to Dockerfile; drop Linux caps.  
- [ ] Write K8s NetworkPolicy (restrict ingress/egress).  
- ✅ Skill bar impact: **Security 1/5 → 3/5**.

---

## Week 10: Observability Polish
- [ ] Install kube-prometheus-stack.  
- [ ] Grafana: CPU, memory, HTTP 5xx panels.  
- [ ] Create alert rule: CPU > 80%.  
- ✅ Skill bar impact: **Monitoring 4/5 → 4.5/5**.

---

## Week 11: Cloud Wiring (EKS or GKE Lite)
- [ ] Provision managed K8s cluster (EKS/GKE).  
- [ ] Deploy Helm chart to dev namespace.  
- [ ] Setup ingress (NGINX or NodePort).  
- ✅ Skill bar impact: **Cloud Arch 2/5 → 3.5/5**.

---

## Week 12: Portfolio Polish
- [ ] Add screenshots + ASCII diagrams to each repo.  
- [ ] One-pager per project (problem → design → commands → trade-offs).  
- [ ] STAR stories: outage fix, pipeline design, cost save.  
- ✅ Final polish → interview-ready.

---

📌 *As you tick off items, bump the skill bars in the dashboard above.*  
- By Week 12 → **Terraform 4/5, K8s/Helm 4/5, Security 3/5, Cloud Arch 3.5/5.**  
- Jenkins/Monitoring already strong (no heavy lifting needed).  
- Overall Progress: **20% → ~75%**.
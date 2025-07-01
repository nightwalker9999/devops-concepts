# Detailed Notes & Q&A: SDLC & Roles

## 1. SDLC Phases

1. **Planning & Analysis**  
   - Stakeholders define requirements → BA drafts BRD → PM prioritizes.
2. **Design**  
   - Architect produces HLD & LLD.
3. **Implementation**  
   - Devs code features → DevOps sets up infrastructure (IaC), containers, and pipelines.
4. **Testing & Integration**  
   - Automated tests run via CI/CD.
5. **Deployment & Maintenance**  
   - Monitoring, alerting, and operational support by DevOps/SRE.

---

## 2. Refined Q&A

**Q1: How does a customer request flow down to DevOps?**  
A1: A customer’s idea → BA drafts BRD → PM prioritizes into epics → PO breaks epics into stories → Architect creates HLD/LLD → Developers implement → DevOps provisions infra, containerizes, and builds CI/CD pipelines.

**Q2: In which SDLC phase does DevOps add the most leverage?**  
A2: **Implementation**—by automating environment provisioning and CI/CD, DevOps eliminates manual handoffs, reduces regressions, and accelerates time to deployment.

**Q3: Why is understanding SDLC important for a DevOps engineer?**  
A3: It clarifies when and how you receive tasks (post-design) and where you can optimize workflows (automation of builds, tests, and deployments).

**Q4: What roles collaborate most closely with DevOps?**  
A4: Developers (for code integration), QA (for test automation), Architects (for environment design), and SREs (for monitoring and reliability).
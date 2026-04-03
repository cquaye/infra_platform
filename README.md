# infra_platform


 ```                                                    
  _____                ____                       _ _          
 |_   _|_ _ _ __   ___/ ___|  ___  ___ _   _ _ __(_) |_ _   _  
   | |/ _` | '_ \ / _ \___ \ / _ \/ __| | | | '__| | __| | | | 
   | | (_| | | | | (_) |__) |  __/ (__| |_| | |  | | |_| |_| | 
   |_|\__,_|_| |_|\___/____/ \___|\___|\__,_|_|  |_|\__|\__, | 
                                                        |___/  


```

**Executive Summary: ELK-Based Observability Platform**

* Built a scalable observability, monitoring, and data pipeline platform using the Elastic Stack (ELK)
* Leveraged **Terraform (IaC)** to provision and manage infrastructure with repeatable, consistent deployments
* Designed architecture using **stateless infrastructure + stateful secrets**

  * Infrastructure is disposable and redeployable
  * TLS certificates and sensitive data persist outside Terraform and are injected at runtime
* Implemented centralized **log ingestion, transformation, and visualization** via Logstash, Elasticsearch, and Kibana
* Enabled secure communication using TLS for platform components

**CI/CD & Security (In Progress / Enhancements)**

* Integrating **Jenkins / GitHub Actions** for pipeline automation
* Using **Ansible** for configuration management and orchestration
* Incorporating **Snyk** for vulnerability scanning and security enforcement

**Future State**

* Transition to **multi-node Elasticsearch cluster** for scalability and high availability
* Implement **Fleet management** for centralized agent control and data collection
* Evolve toward a fully automated, production-grade observability platform
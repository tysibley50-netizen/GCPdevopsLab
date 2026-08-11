**Requirements**

1. Administers and manages cloud infrastructure within Google Cloud Platform (GCP), including compute, storage, networking, and IAM
2. Provisions, configures, and maintains cloud resources using infrastructure-as-code and automation tools
3. Monitors system performance, availability, and cost efficiency across cloud environments
4. Implements and enforces security best practices, including identity management, access controls, and compliance standards (e.g., SOC 2)
5. Manages backups, disaster recovery strategies, and business continuity processes within cloud environments
6. Collaborates with engineering teams to support application deployments and optimize system performance -- formulate three plans, find best plan, suggest as a way forward in this collaboration
7. Troubleshoots and resolves system and application-level issues in a timely manner
8. Maintains and improves CI/CD pipelines and deployment processes with tools like Github Actions in collaboration with development teams
    - A CI/CD pipeline is an automated assembly line for software. Instead of an engineer spinning up their own testing, a set of automated scripts handles the entire process every time code is updated.
    - GCP is where the code lives, cloudrun being the platform
    - GitHub Actions (written in YAML, a human readable language that is used to describe system configurations, provide automation, and enable DevOps tools) is the engine - triggers, builds runners, and worflow scripts
    - This pipeline in action goes - https://www.youtube.com/watch?v=ZgVhU5qvK1M engineer pushes code to a specific branch, GitHub Actions vm spins up, downloads repository, runs automated test, code linters, and security scanners. It does this with a secure bridge (keyless auth) using Workload Identity Federation (WIF** WIF is a security method tht lets software workloads (like apps, containers etc,) to auth with a cloud or service using an external identity provider), then issues a short lived OIDC Token and exchanges it for a temporary short lived IAM access token, then github actions pushes the docker image into the Google Artifact Registry (fully managed cloud service on GCP used to store, manage, and secure container images and language packages), then Github Actions executes a deployment command to GCP compute services, such as cloud run(), Google kubernetes engine(), or Compute Engine() -- these are not the only compute services google has, just know that Github Actions can be customized to deploy to all of these, then during deployment GCP performs a rolling update (updates an app instance or server gradually instead of all at once, w/health checks to ensure the validity of the updates) then reports success back to Github actions
9. Analyzes system usage and recommends scaling strategies to ensure performance and cost optimization (uses Google Cloud Operations Suite or datadog, agents on observability platforms collect the what, why, and how of your code/compute services running that code)
10. Documents system configurations, processes, and procedures to ensure clarity and consistency
11. Supports incident response efforts and participates in root cause analysis
12. Provides on-call support to meet service level objectives and ensure system uptime
13. Designs and supports multi-tenant architectures(basically a single app serving multiple distinct customers, known as tenants), including data isolation strategies (basically how will you seperate the data -- Seperate databases? Shared databases, seperate schema?, or fully shared Database(Row level isolation?)), sharding approaches(sharding is a methodology that breaks the database into smaller,more manageable pieces), and tenant-aware resource management (ie load balancing if one tenant use significantly more resources than another)
14. Implements tenant-level monitoring, alerting, and observability to ensure performance and reliability across environments
15. Continuously evaluates and implements new tools and technologies to improve system reliability and efficiency
Perform other duties as assigned
Knowledge, Skills & Abilities

**Principles to Know**

16. Knowledge of cloud security principles, IAM roles, and access control models
17. Familiarity with containerization technologies (Docker) and orchestration tools (Kubernetes/GKE)
18. Strong troubleshooting and problem-solving skills across distributed systems
Understanding of networking concepts (TCP/IP, DNS, load balancing, firewalls) in cloud environments
19. Proficiency with scripting (e.g., Python, Bash) for automation tasks
20. Excellent verbal and written communication skills
21. Strong organizational skills and attention to detail
22. Ability to manage multiple priorities and work independently in a fast-paced environment

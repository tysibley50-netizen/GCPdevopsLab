# GCPdevopsLab
# Stuff so far
- Deployed a tiny python app to cloud run to simulate click-ops environment at work. Flask to act as the framework, Gunicorn to act as a WSGI server, and docker to package it all as a container on top of cloud run. More to come on what Flask and Gunicorn are.
#Branch made to work in GCP

# 08252026
today I was able to create a cloud storage bucket to save my IAC for my tiny clickops improvement project. I saved IAC on my desktop as well as in the repository. .gitignore updated will relevant files to leave out and tomorrow I will structure my terraform repository better and leverage the cloud storage bucket.

# 09102026
After overcoming a type in my imports.tf file, finally was able to setup a VPC, monitoring, and secrets with terraform regarding my tiny CR V2 service. Super stoked as we finally can proceed to phase 3.

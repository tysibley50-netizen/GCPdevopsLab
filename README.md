# GCPdevopsLab
# Stuff so far
- Deployed a tiny python app to cloud run to simulate click-ops environment at work. Flask to act as the framework, Gunicorn to act as a WSGI server, and docker to package it all as a container on top of cloud run. More to come on what Flask and Gunicorn are.
#Branch made to work in GCP

# 08252026
today I was able to create a cloud storage bucket to save my IAC for my tiny clickops improvement project. I saved IAC on my desktop as well as in the repository. .gitignore updated will relevant files to leave out and tomorrow I will structure my terraform repository better and leverage the cloud storage bucket.

# 09102026
After overcoming a type in my imports.tf file, finally was able to setup a VPC, monitoring, and secrets with terraform regarding my tiny CR V2 service. Super stoked as we finally can proceed to phase 3.

# 09162026
So far today I have set up an artifact registry as IAC, created a tiny app to deploy into Cloud run using python, FastAPI, and containerized into Docker. Edited variables to include default container image, and verified the app could run locally. Phase 4 - complete. Phase 5 also complete. Look into github actions failing then active recall!

# 09182026
I was unable to get the full pipeline working due to an error in my image tags. Next session will require debugging in Docker yml associated with my app.

# 09/21/2026

Today I will be troubleshooting my GH Actions pipeline. Looks like we were denied permissions on our project? Repushing first to troubleshoot issue and performing follow on actions if needed.

- Looks like I foolishly hardcoded the docker repo, of which my service account did not have access to. Its like Claude just speaks the language of information. Love itTemporarily create app-repo in my region to troubleshoot further.Last update - I was unable to get this going likely from a discrepancy in app-repo and my existing repo. Start there.

import os
from fastapi import FastAPI, Response, status

app = FastAPI(title="Demo Cloud Run App")

@app.get("/")
def read_root():

    api_key = os.getenv("API_KEY", "NOT_SET")

    masked_key = f"{api_key[:4]}..." if api_key != "NOT_SET" and len(api_key) > 4 else "NOT_SET"

    return {
        "status": "online",
        "message": "Deployment successful via CI/CD pipeline!",
        "secret_status": "Loaded from Secret Manager" if api_key != "NOT_SET" else "Missing",
        "masked_key_preview": masked_key
    }

@app.get("/health")
def health_check(response: Response):

    return{"status": "healthy"}

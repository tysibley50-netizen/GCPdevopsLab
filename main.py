import os
from flask import Flask

app = Flask(__name__)

@app.route("/")
def hello():
    return {"status": "success", "message": "ClickOps deployment live!"}, 200

if __name__ == "__main__":
    port = int(os.environ.get("PORT", 8080))
    app.run(host="0.0.0.0", port=port)

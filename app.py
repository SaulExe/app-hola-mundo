from flask import Flask
import os

app = Flask(__name__)

@app.get("/")
def root():
    return "Hola mundo desde Render + Docker 🎉"

if __name__ == "__main__":
    port = int(os.environ.get("PORT", 10000))  # Render suele usar 10000
    app.run(host="0.0.0.0", port=port)

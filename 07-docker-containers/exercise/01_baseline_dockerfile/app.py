from flask import Flask
app = Flask(__name__)

@app.route("/health")
def health():
    return {"status": "ok"}, 200

@app.route("/")
def hello():
    return "Hello from docker-flask-opt!", 200

if __name__ == "__main__":
    app.run(host="0.0.0.0", port=5000)

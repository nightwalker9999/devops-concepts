from flask import Flask
app = Flask(__name__)

@app.route("/healthz")
def healthz():
    return "ok", 200

@app.route("/")
def index():
    return "hello", 200

if __name__ == "__main__":
    app.run(host="0.0.0.0", port=8080)

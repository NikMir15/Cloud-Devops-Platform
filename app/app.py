from flask import Flask, jsonify

app = Flask(__name__)

@app.route("/")
def home():
    return "Cloud DevOps Platform is running ✅\n"

@app.route("/health")
def health():
    return jsonify(status="ok"), 200

from flask import Flask, jsonify

app = Flask(__name__)

@app.route("/")
def root():
    return jsonify({"msg": "Hello World"})


if __name__ == "__main__":
    app.run(threaded=True, host="127.0.0.1", port=8000)


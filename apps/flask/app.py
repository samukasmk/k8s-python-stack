from flask import Flask, render_template, jsonify, request

app = Flask(__name__)


@app.route("/")
def website():
    print('Hello:', request)
    return render_template("index.html")


@app.route("/healthz")
def healthz():
    data = {'app': 'website', 'status': 'success'}
    return jsonify(data)


if __name__ == "__main__":
    app.run(port=8000)

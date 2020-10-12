from flask import Flask, jsonify
import sys
import os

app = Flask(__name__)

@app.route('/processall', methods=['GET'])
def TODO():
    return 0

@app.route('/process/<method>/<situation>', methods=['GET'])
def TODO(method,situation):
    return 0

if __name__ == '__main__':
    app.run(host='0.0.0.0', debug=True)

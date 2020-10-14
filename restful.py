from flask import Flask, jsonify
import sys
import os

app = Flask(__name__)

methods = 

@app.route('/processall', methods=['GET'])
def TODO():
    return 0

@app.route('/process/<problem>/<method>/', methods=['GET'])
def TODO(problem,method):
    return 0

if __name__ == '__main__':
    app.run(host='0.0.0.0', debug=True)

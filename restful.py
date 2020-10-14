from flask import Flask, jsonify
import sys
import os

app = Flask(__name__)

methods = ['MC','MC-S','QMC-S','MLMC','MLMC-A',\
           'FFT','FGL','COS',\
           'FD','FD-NU','FD-AD',\
           'RBF','RBF-FD','RBF-PUM',\
           'RBF-LSML','RBF-AD','RBF-MLT']

@app.route('/processall', methods=['GET'])
def TODO():
    return 0

@app.route('/process/<problem>/<method>/', methods=['GET'])
def TODO(problem,method):
    return 0

if __name__ == '__main__':
    app.run(host='0.0.0.0', debug=True)

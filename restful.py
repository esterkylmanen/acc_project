from flask import Flask, jsonify
import sys
import os
from mrun_celtasks import run_problem_method

app = Flask(__name__)

methods = ['MC','MC-S','QMC-S','MLMC','MLMC-A',\
           'FFT','FGL','COS',\
           'FD','FD-NU','FD-AD',\
           'RBF','RBF-FD','RBF-PUM',\
           'RBF-LSML','RBF-AD','RBF-MLT']

problems = ['1_a_1', '1_b_1', '1_c_1', '1_a_2', '1_b_2', '1_c_2']

@app.route('/process/<problem>/<method>/', methods=['GET'])
def pmthd(problem,method):
    mtd = method
    if(mtd.lower() == "all"):
        mtd = methods
    else:
        mtd = [mtd]
    pbl = problem
    if(pbl.lower() == "all"):
        pbl = problems
    else:
        pbl = [pbl]
    #placeholder
    return run_problem_method(problem,method)

if __name__ == '__main__':
    app.run(host='0.0.0.0', debug=True)

from flask import Flask, jsonify, request
import sys
import os
from mrun_celtasks import run_scenario
#import pyoctave_connector as poc

app = Flask(__name__)

methods = ['MC','MC-S','QMC-S','MLMC','MLMC-A',\
           'FFT','FGL','COS',\
           'FD','FD-NU','FD-AD',\
           'RBF','RBF-FD','RBF-PUM',\
           'RBF-LSML','RBF-AD','RBF-MLT']

problems = ['1_a_1', '1_b_1', '1_c_1', '1_a_2', '1_b_2', '1_c_2']

global_next_id = 0
global_jobs = []

@app.route('/process/<problem>/<method>/<S>/<K>/<T>/<r>/<sig>', methods=['GET'])
def pmthd(problem,method,S,K,T,r,sig):
    # get the parameters for MATLAB code from users
    S = [int(x) for x in S.split("_")]
    parameters = [S,K,T,r,sig]

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
    argument_set = []
    for m in mtd:
        for p in pbl:
            argument_set.append(["\"{}\"".format(problem), "\"{}\"".format(method)] + parameters)
    #arguments = ["\"{}\"".format(problem), "\"{}\"".format(method)] + parameters
    result_set = [run_scenario.delay(args) for args in argument_set]
    #result = poc.call_octave("choose",arguments)
    global global_jobs
    global global_next_id
    global_jobs.append(result_set)
    global_next_id = global_next_id + 1
    return "The job has been started. Your job ID: "+str(global_next_id-1)+".\n" #TODO

@app.route('/checkprogress', methods=['GET'])
def progcheckglobal():
    status_sets = []
    global global_jobs
    for relevant_job_num in range(len(global_jobs)):
        status_sets.append("Job "+str(relevant_job_num)+": "+", ".join([task.state for task in global_jobs[relevant_job_num]])+".\n")
    return "".join(status_sets)

@app.route('/checkprogress/<identifier>', methods=['GET'])
def progcheckspecific(identifier):
    ident = int(identifier)
    global global_jobs
    if(ident >= len(global_jobs)):
        return "ERROR: Invalid job number."
    relevant_job = global_jobs[ident]
    status_set = [task.state for task in relevant_job]
    return ", ".join(status_set)+".\n"

@app.route('/getresult/<identifier>', methods=['GET'])
def get_result(identifier):
    results = []
    global global_jobs
    for task in global_jobs[int(identifier)]:
        results.append(task.get(timeout=999))
    return "\n".join("Time: "+results[0]+"; Error: "+results[1])+".\n"

if __name__ == '__main__':
    app.run(host='0.0.0.0', debug=True)

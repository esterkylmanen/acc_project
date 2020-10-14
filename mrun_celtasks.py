from celery import Celery
import pyoctave_connector

app = Celery('taskrunner',backend='rpc://',broker='pyamqp://group8_user:notthatsecretpassword@192.168.29.153:5672/g8vhost')

@app.task
def placeholder():
    return True

@app.task
def run_problem_method(p,m):
    return 

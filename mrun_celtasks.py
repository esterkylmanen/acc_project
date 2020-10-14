from celery import Celery
import pyoctave_connector as poc

app = Celery('taskrunner',backend='rpc://',broker='pyamqp://group8_user:notthatsecretpassword@130.238.29.153:5672/g8vhost')

@app.task
def placeholder():
    return True

@app.task
def run_scenario(arguments):
    return poc.call_octave("choose",arguments)

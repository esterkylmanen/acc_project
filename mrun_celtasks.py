from celery import Celery

app = Celery('taskrunner',backend='rpc://',broker='pyamqp://group8_user:notthatsecretpassword@192.168.29.153:5672/g8vhost')

@app.task
def placeholder():
    return True

from celery import Celery

app = Celery('taskrunner',backend='rpc://',broker='TODO')#'pyamqp://daniel:rabbitpassword@192.168.2.116:5672/lab3_2_vhost')

@app.task
def placeholder():
    return True

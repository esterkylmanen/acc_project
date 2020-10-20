# http://docs.openstack.org/developer/python-novaclient/ref/v2/servers.html
import time, os, sys
import inspect
import math
from os import environ as env

from  novaclient import client
import keystoneclient.v3.client as ksclient
from keystoneauth1 import loading
from keystoneauth1 import session
from mrun_celtasks import app


def create_new_worker(worker_num,user,pswd):
    flavor = "ssc.xsmall" #"ACCHT18.normal" 
    private_net = "UPPMAX 2020/1-2 Internal IPv4 Network" #My addition
    floating_ip_pool_name = None
    floating_ip = None
    image_name = "Ubuntu 18.04"

    loader = loading.get_plugin_loader('password')

    auth = loader.load_from_options(auth_url="https://east-1.cloud.snic.se:5000/v3",
                                    username=user,
                                    password=pswd,
                                    project_name="UPPMAX 2020/1-2",
                                    project_domain_name="snic",
                                    project_id="fc1aade83c2e49baa7498b3918560d9f",
                                    user_domain_name="snic")

    sess = session.Session(auth=auth)
    nova = client.Client('2.1', session=sess)

    image = nova.glance.find_image(image_name)

    flavor = nova.flavors.find(name=flavor)

    if private_net != None:
        net = nova.neutron.find_network(private_net)
        nics = [{'net-id': net.id}]
    else:
        sys.exit("private-net not defined.")

    cfg_file_path =  os.getcwd()+'/contex_script.txt'
    if os.path.isfile(cfg_file_path):
        userdata = open(cfg_file_path)

    secgroups = ['default','dani_secgroup']
    for i in range(worker_num):
        print("Creating worker "+str(i))
        instance = nova.servers.create(name="group8_autoscale_worker"+str(i), image=image, flavor=flavor, userdata=userdata, nics=nics,security_groups=secgroups,key_name="group8_keypair")

#!/usr/bin/python
import os
import sys
import random
import requests
import json


BASEURL = "http://localhost:3000/"
#BASEURL = "https://akugel.uber.space/fastify/"
PROD = "products"
LOGIN = "login"


class Product:
    def __init__(self,name):
        self.name = "product_" + str(name)
        self.image = "dwefnewfjn"
        self.unit = u"€"
        self.expires_in = 100

def login():
    r = requests.get(url=BASEURL+LOGIN,
        auth = ("user1@x.y","1234"))
    #print(r.text)
    return json.loads(r.text)

print("Starting, args", sys.argv)
if len(sys.argv) > 1:
    msgs = int(sys.argv[1])
else:
    msgs = 1000
print("MSGS:",msgs)


token = login()["token"]
if token == None:
    print("No token")
    sys.exit()
else:
    print("Using token:",token)

hdr = {
    "content-type":"application/json",
    "authorization": f"Bearer {token}"
    }


for i in range(msgs):
    try:
        p = Product(i)
        pp = json.dumps(p.__dict__)
        #print(pp)
        url = BASEURL+PROD
        r = requests.post(url=url,headers = hdr, data = pp)
        #print(r.status_code)
        pr = json.loads(r.text)
        id = pr["id"]
        #print("ID: ",id)
        # delete id
        r = requests.delete(url="/".join([url,id]),headers = hdr, json={"id":id})
        #print(r.status_code)
        if i % 100 == 0:
            print(i)
        
    except:
        print("Some error")
        

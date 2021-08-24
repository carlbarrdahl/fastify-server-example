#!/usr/bin/python
import multiprocessing
from multiprocessing import Pool
import os
import sys
import time
import random
import subprocess
import json

# 4 node services:
# Time delta:  136.86979794502258
# Total messages:  100000
# Performance:  730.6213752150616  msg/s
# We're done

# 5 or 8 node services:
# Time delta:  212.2671604156494
# Total messages:  160000
# Performance:  753.7670908994927  msg/s
# We're done


PROC_MSGS = 4000
CMD = "./products.py"

PROCS = 25

MODULO = 5 # number of running fastify servers
# start servers like: export PORT=300x; node dist/src/index.js

def runtest(i):
        port = 3000
        if MODULO > 0:
                port += i%MODULO
        args = " ".join([CMD,str(PROC_MSGS),str(port)])
        # print("Cmd:",i,":",args)
        # no putput capture
        # x = subprocess.run(args.split(" "),text=True)
        # with output capture
        x = subprocess.run(args.split(" "),text=True,stdout=subprocess.PIPE,stderr=subprocess.STDOUT)
        print("Subprocess complete")
        return x

if __name__=="__main__":

        cpus = multiprocessing.cpu_count()
        #cpus = 40
        print("cpus:",cpus)

        print("Pool")
        pool=Pool(processes=PROCS)
        # async. could also do sync without wait
        #result = pool.map_async(child,args)
        t0 = time.time()
        result = pool.map_async(runtest,list(range(PROCS)))
        print("Waiting")
        result.wait() #timeout = 10)
        t1 = time.time()
        print("Results:\n",result.get())
        
        tm = t1 - t0
        print("Time delta: ",tm)
        msgs = PROCS*PROC_MSGS
        print("Total messages: ",msgs)
        print("Performance: ",msgs/tm, " msg/s")

        print("We're done")



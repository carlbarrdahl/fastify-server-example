#!/usr/bin/python
import multiprocessing
from multiprocessing import Pool
import os
import sys
import time
import random
import subprocess
import json


PROC_MSGS = 400
CMD = "./products.py"

PROCS = 25

def runtest(i):
        args = " ".join([CMD,str(PROC_MSGS)])
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



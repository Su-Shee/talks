#!/usr/bin/env python

import zmq
import sys
import time

port = "9999"

context = zmq.Context()
socket = context.socket(zmq.PUB)
socket.bind("tcp://*:%s" % port)

while True:
    socket.send("HELLO HELLO HELLO\n")
    time.sleep(1)



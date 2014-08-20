#!/usr/bin/env python

import sys
import zmq

port = "9999"

# Socket to talk to server
context = zmq.Context()
socket = context.socket(zmq.SUB)

socket.connect ("tcp://localhost:%s" % port)

socket.setsockopt(zmq.SUBSCRIBE, 'HELLO')
string = socket.recv()

print string

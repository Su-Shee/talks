#!/usr/bin/env perl

use strict;
use warnings;

use ZMQ::LibZMQ3;
use ZMQ::Constants qw/:all/;

my $ctxt   = zmq_init;
my $socket = zmq_socket( $ctxt, ZMQ_SUB);

zmq_connect( $socket, "tcp://127.0.0.1:9999" );
zmq_setsockopt( $socket, ZMQ_SUBSCRIBE, '' );

my $msg = zmq_msg_init();

  print "receiving...\n";
  my $ret = zmq_msg_recv( $msg, $socket );
  print $ret;
  print $msg;
  print "got it!\n";


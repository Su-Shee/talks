#!/usr/bin/env perl

use strict;
use warnings;

use ZMQ::LibZMQ3;
use ZMQ::Constants qw/:all/;

my $ctxt   = zmq_init;
my $socket = zmq_socket( $ctxt, ZMQ_PUB);

zmq_bind( $socket, "tcp://127.0.0.1:9999" );

while (1) {
  print "sending...\n";
  my $howmuch = zmq_msg_send( "HELLO HELLO HELLO\n", $socket );
  print "sent: $howmuch\n";
  sleep(5);
}



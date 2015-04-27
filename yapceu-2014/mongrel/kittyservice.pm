#!/usr/bin/env perl

use strict;
use warnings;

use feature 'say';

use ZMQ::LibZMQ4;
use ZMQ::Constants qw/:all/;

my $ctxt   = zmq_init;
my $socket = zmq_socket( $ctxt, ZMQ_PUB);

zmq_bind( $socket, "tcp://127.0.0.1:9999" );

while (1) {
  say "sending...";
  my $howmuch = zmq_msg_send( "HELLO HELLO HELLO", $socket );
  say "sent: $howmuch";
  sleep(5);
}



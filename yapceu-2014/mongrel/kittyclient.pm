#!/usr/bin/env perl

use strict;
use warnings;

use feature 'say';

use ZMQ::LibZMQ4;
use ZMQ::Constants qw/:all/;

my $ctxt   = zmq_init;
my $socket = zmq_socket( $ctxt, ZMQ_SUB);

zmq_connect( $socket, "tcp://127.0.0.1:9999" );
zmq_setsockopt( $socket, ZMQ_SUBSCRIBE, '' );

my $msg = zmq_msg_init();

say "receiving...";

say zmq_msg_recv( $msg, $socket );
say zmq_msg_data( $msg );

say "got it!";


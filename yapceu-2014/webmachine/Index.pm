#!/usr/bin/env perl

package Index;

use strict;
use warnings;

use Web::Machine;
use Template::Jade qw/render_file/;
use CSS::Tiny;

use parent 'Web::Machine::Resource';

sub content_types_provided { [{ 'text/css' => 'to_css'}, {'text/html' => 'to_html' }] }

sub to_html {
  return render_file('index.jade');
}

sub to_css {
  my $css = CSS::Tiny->new;
  $css->read('machineexample.css');
  return $css->write_string;
}

1;


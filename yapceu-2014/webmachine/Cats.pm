#!/usr/bin/env perl

package Cats;
use strict;
use warnings;

use Web::Machine;
use Web::Machine::Util qw/bind_path/;
use Template::Jade qw/:all/;
use IO::All;
use CSS::Tiny;

use parent 'Web::Machine::Resource';

our $USER;
our $CATPIC;

opendir(my $dir, 'catpics/') or die "Can't open kittydir!";
my @catpics = readdir($dir);

sub allowed_methods        { [qw[ GET POST ]] }
sub content_types_provided { [
                               { 'text/html' => 'to_html' },
                               { 'image/gif' => 'to_gif' },
                               { 'text/css'  => 'to_css' },
                             ]}

sub to_css {
  my $css = CSS::einy->new;
  $css->read('machineexample.css');
  return $css->write_string;
}

sub process_post {
   my $self = shift;
   $USER = $self->request->param('username');
   $self->response->header('Location' => '/cats');
   return \301;
}

sub to_gif {
  return io->file('catpics/' . $CATPIC)->binary->all;
}

sub extract_user_from_route {
  return bind_path( '/:user', shift->request->path_info );
}

sub to_html {
  my $self = shift;
  my $user = $self->extract_user_from_route;

  unless ($USER) {
  }

  if ( length($USER) < 4) {
    return render_file('shortname.jade', { template => { username => $USER } } );
  } else {
    $CATPIC = $catpics[ rand @catpics ];
    return render_file('userscat.jade',
        { template => { username => $USER, catpic => 'catpics/' . $CATPIC } } );
  }
}
1;

#!/usr/bin/env perl

use Mojolicious::Lite;
use Mojo::Pg;

my $pg  = Mojo::Pg->new('postgresql://postgres@/kittycats');
my $db  = $pg->db;
my $res = $db->query('SELECT picture FROM cats');

my @catpics = @{ $res->array };

get '/' => sub {
  shift->render('index');
};

get '/cats' => sub {
  shift->render('allcats');
};

post '/cats' => sub {
  my $c = shift;
  if ( $c->param('username') ) {
    my $user = $c->param('username');
    $c->redirect_to('/cats/'. $user);
  } else {
    $c->render('allcats', allcats => \@catpics);
  }
};

get '/cats/:user' => sub {
  my $c    = shift;
  my $user = $c->param('user');

  if ( length $user < 4 ) {
    $c->render('shortname', username => $user);
  } else {
    my $catpic = $catpics[ rand @catpics ];
    $c->render('userscat', username => $user, catpic => $catpic);
  }
};

app->start;

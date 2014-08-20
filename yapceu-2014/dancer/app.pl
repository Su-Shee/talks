#!/usr/bin/env perl

use Dancer2;

set 'template' => 'template_toolkit';

opendir(my $dir, 'public/catpics/') or die "Can't open kittydir!";
my @catpics = readdir($dir);

get '/' => sub {
  template 'index.tt';
};

get '/cats' => sub {
  template 'allcats.tt';
};

post '/cats' => sub {
  if ( params->{'username'} ) {
    my $user = params->{'username'};
    redirect '/cats/'. $user;
  } else {
    template 'allcats', { allcats     => \@catpics,
                          catpics_url => uri_for('/catpics/') };
  }

};

get '/cats/:user' => sub {
  my $user = params->{'user'};

  if ( length $user < 4 ) {
    template 'shortname.tt', { username => $user };
  } else {
    my $catpic = $catpics[ rand @catpics ];
    template 'userscat.tt', { username => $user, catpic_url => uri_for('/catpics/' . $catpic) };
  }
};

start;

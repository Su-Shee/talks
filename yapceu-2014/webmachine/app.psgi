use Plack::Builder;
use Web::Machine;

builder {
  mount '/'     => builder {
    Web::Machine->new(resource => 'Index')->to_app
  };
  mount '/cats' => builder {
    Web::Machine->new(resource => 'Cats')->to_app
  };
};


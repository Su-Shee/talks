#!/usr/bin/env ruby

require 'sinatra';
require 'slim';

allcats = Dir.entries('public/catpics/')

get '/' do
  slim :index
end

get '/cats/' do
  slim :allcats, locals: { :allcats => allcats }
end

post '/cats' do
  username = params[:username]
  if username
    redirect "/cats/#{username}"
  else
    redirect "/cats/"
  end
end

get '/cats/:user' do
  username = params[:user]
  catpic   = allcats.sample
  if username.length < 4
    slim :shortname, locals: { :username => username }
  else
    slim :userscat, locals: { :username => username, :catpic => catpic }
  end
end

__END__

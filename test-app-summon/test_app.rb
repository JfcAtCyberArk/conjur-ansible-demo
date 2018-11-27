#!/usr/bin/env ruby

require 'sinatra'

enable :logging

configure do
  set :bind, '0.0.0.0'
end

get '/' do
  begin
    "
      <h1>Welcome to Conjur Ops!</h1>
      <p>Database Password: #{ENV['DB_PASSWORD']}</p>
    "
  rescue
    $stderr.puts $!
    $stderr.puts $!.backtrace.join("\n")
    halt 500, "Error: #{$!}"
  end
end

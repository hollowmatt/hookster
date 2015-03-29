require 'pry-byebug'
require 'json'
require 'haml'

class RepudiatorController < ApplicationController

  get '/' do
    haml :index
  end

  post '/badger' do
    status 204
    request.body.rewind
    request_payload = JSON.parse(request.body.read)
    @badger = BadgerMonitor.new(:event => request_payload["event"], :message => request_payload["message"])
    @badger.save
    if @badger.event == "down"
      puts "do something interesting"
    else
      puts "we're live people"
    end
  end

end
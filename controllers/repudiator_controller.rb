require 'pry-byebug'
require 'json'
require 'haml'
require 'sinatra'
require 'sass'
require "sinatra/reloader" if development?
require 'better_errors'  if development?
require "pry-byebug" if development?
require 'mongo_mapper'
require "hashie"
require 'mongo'

class RepudiatorController < Sinatra::Application

  set :static, true
  set :views, File.expand_path('../../views', __FILE__)
  set :public_folder, 'public'

  configure :development do
    enable :logging
    register Sinatra::Reloader  #reload after changes
    use BetterErrors::Middleware
    BetterErrors.application_root = File.expand_path('..', __FILE__)
  end

  configure do
    db_config = YAML.load_file("config/database.yml")
    host = db_config[settings.environment.to_s]['mongodb']['host']
    database = db_config[settings.environment.to_s]['mongodb']['database']

    mongo_client = Mongo::MongoClient.new(host)
    MongoMapper.connection = mongo_client
    MongoMapper.database = database
  end

  get '/' do
    @events = BadgerMonitor.all
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
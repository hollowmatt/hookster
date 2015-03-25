require 'sinatra'
require 'haml'
require 'sass'
require "sinatra/reloader" if development?
require 'better_errors'  if development?
require "pry-byebug" if development?
require 'mongo_mapper'
require "hashie"
require 'mongo'

class ServiceBaseApp < Sinatra::Base
  configure :development do
    register Sinatra::Reloader  #reload after changes
    use BetterErrors::Middleware
    BetterErrors.application_root = File.expand_path('..', __FILE__)
  end

  configure do
    set :public_folder => 'public'

    db_config = YAML.load_file("config/database.yml")
    host = db_config[settings.environment.to_s]['mongodb']['host']
    database = db_config[settings.environment.to_s]['mongodb']['database']

    mongo_client = Mongo::MongoClient.new(host)
    MongoMapper.connection = mongo_client
    MongoMapper.database = database
  end

end
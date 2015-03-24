class ApplicationController < Sinatra::Base
  Sinatra::Base
  helpers ApplicationHelper

  set :views File.expand_path('../../views', __FILE__)

  configure :development do
    enable :logging
  end

  get '/' do
    [418, "I'm a teapot"]
  end
end
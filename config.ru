require "./config/boot.rb"

set :server, 'thin'

Dir["./helpers/*.rb"].each { |helper| require helper }
Dir["./controllers/*.rb"].each { |controller| require controller }

map('/repudiator') { run RepudiatorController }
map('/') { run ApplicationController }
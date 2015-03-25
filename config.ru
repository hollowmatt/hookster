require "./config/boot.rb"

set :server, 'thin'

Dir["./helpers/*.rb"].each { |helper| require helper }
Dir["./controllers/*.rb"].each { |controller| require controller }
Dir["./models/**/*.rb"].each { |model| require model }

map('/repudiator') { run RepudiatorController }
map('/') { run ApplicationController }
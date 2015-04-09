require "./config/boot.rb"

# set :server, 'thin'

Dir["./helpers/*.rb"].each { |helper| require helper }
Dir["./controllers/*.rb"].each { |controller| require controller }
Dir["./models/**/*.rb"].each { |model| require model }

use Rack::Static, :urls => ['/css', '/js', '/img', '/fonts'], :root => 'public'

map('/') { run RepudiatorController }
map('/repudiator') { run RepudiatorController }
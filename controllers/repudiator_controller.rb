class RepudiatorController < ApplicationController

  post '/badger' do
    status 204
    request.body.rewind
    request_payload = JSON.parse(request.body.read)
    puts request_payload
  end

end
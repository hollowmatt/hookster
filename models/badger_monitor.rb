class BadgerMonitor
  include MongoMapper::Document
  key :event, String, :required => true
  key :message, String, :required => true

  timestamps!

end
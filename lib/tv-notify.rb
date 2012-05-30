require 'bundler/setup'
require 'libnotify'
require 'nokogiri'
require 'net/http'
require 'chronic'
require 'uri'

# Require all providers.
Dir[File.expand_path('tv-notify/*.rb', File.dirname(__FILE__))].each do |f|
  require f
end

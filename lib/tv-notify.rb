require 'bundler/setup'
require 'libnotify'
require 'nokogiri'
require 'net/http'
require 'chronic'
require 'uri'

def require_provider provider
  require_relative "tv-notify/#{provider}.rb"
end

require_provider :locatetv

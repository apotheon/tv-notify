require 'bundler/setup'
require 'libnotify'
require 'nokogiri'
require 'net/http'
require 'chronic'
require 'yaml'
require 'uri'

# Require all providers.
Dir[File.expand_path('tv-notify/*.rb', File.dirname(__FILE__))].each do |f|
  require f
end

# Get settings from config file.
config_file = ARGV[0] || 'tv-notify.yml'
settings = YAML.load_file(config_file)

settings = settings.inject({}) do |memo, (k, v)|
  memo[k.to_sym] = v
  memo
end

# Get show listings.
exit unless settings[:show]

case settings[:provider].downcase
when 'locatetv'
  listings = TVNotify::LocateTV.get_show_listings(settings[:show])

else
  puts 'Oh no!'
  puts "Looks like you haven't set a provider."
  exit
end

# Notify!
time_limit = settings[:time] || 300 # = 5 Minutes

listings.each do |listing|
  show_time = Chronic.parse(listing[:time])
  time_from_now = show_time - Time.now

  if time_from_now <= time_limit and time_from_now >= 0
    body = "#{listing[:time].capitalize} on #{listing[:channel]}"
    Libnotify.show summary: settings[:show], body: body, timeout: 5, transient: true
  end
end

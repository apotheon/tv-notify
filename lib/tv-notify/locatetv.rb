require 'net/http'
require 'nokogiri'
require 'uri'

module TVNotify
  module LocateTV
    @base_uri = 'http://www.locatetv.com/tv/'

    def self.parse_show_name name
      name.downcase.gsub ' ', '-'
    end

    def self.get_show_uri show
      show = parse_show_name(show)
      URI.join @base_uri, show
    end

    def self.get_show_listings show
      show_uri = self.get_show_uri(show)

      document = Net::HTTP.get(show_uri)
      document = Nokogiri::HTML(document)

      listings = []
      document.css('.schedTv').each do |schedule|
        time = schedule.css('.time').inner_text
        channel = schedule.css('.channel').inner_text

        listings << { time: time, channel: channel }
      end
      listings
    end
  end
end

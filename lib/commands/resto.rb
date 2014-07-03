# -*- encoding : utf-8 -*-
require 'oauth'
require 'json'
require 'open-uri'

class Resto < Flower::Command
  respond_to "resto"

  def self.description
    description = <<-HERE
Affiche les restos les plus proches du bureau
usage : !resto [japonais, pizza...]
    HERE
    return description
  end

  def self.respond(message)
    if message.argument
      query = message.argument.split(' ').first
    else
      query = "restaurants"
    end
    consumer = OAuth::Consumer.new(Flower::Config.yelp_consumer_key,
                                   Flower::Config.yelp_consumer_secret,
                                   {site: "http://#{Flower::Config.yelp_api_host}"})
    access_token = OAuth::AccessToken.new(consumer,
                                          Flower::Config.yelp_token,
                                          Flower::Config.yelp_token_secret)
    path = "/v2/search?term=#{URI::encode query}&limit=5&ll=48.897891,2.279143&radius_filter=1000"

    response = JSON.parse(access_token.get(path).body)
    region   = response['region']
    restos   = response['businesses']
    list = ""

    restos.each do |resto|
      name     = resto['name']
      address  = resto['location']['display_address'].join(' ')
      rating   = resto['rating']
      distance = format_distance resto['distance']
      website  = resto['url']
      list << "→ #{name} à #{distance} d'ici : #{address} (#{pluralize(rating, 'étoile')})\n"
    end

    message.say(list, tags: 'resto')
  end

  private
    def self.pluralize(n, singular, plural=nil)
      if n == 1
          "1 #{singular}"
      elsif plural
          "#{n} #{plural}"
      else
          "#{n} #{singular}s"
      end
    end

    def self.format_distance(distance)
      if distance >= 1000
        (distance / 1000).round(2).to_s + " km"
      else
        distance.round.to_s + " m"
      end
    end
end

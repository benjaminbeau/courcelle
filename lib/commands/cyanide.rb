# -*- encoding : utf-8 -*-
require 'typhoeus'
require 'nokogiri'

class Cyanide < Flower::Command
  respond_to 'cyanide'

  def self.description
    <<-HERE
Affiche le Cyanide and Happiness du jour
usage : !cyanide
    HERE
  end

  def self.respond(message)
    url = 'http://explosm.net/'

    document = Nokogiri.HTML(Typhoeus::Request.get(url).body)
    if img = document.at_css('img#featured-comic')
      message.say('http:' + img[:src])
    end
  end
end

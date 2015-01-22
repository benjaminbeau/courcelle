# -*- encoding : utf-8 -*-
require 'typhoeus'

class DilbertStrip < Flower::Command
  respond_to 'dilbert'

  def self.description
    <<-HERE
Affiche le dernier comics de dilbert.com
usage : !dilbert
    HERE
  end

  def self.respond(message)
    url = 'http://dilbert.com'

    document = Nokogiri.HTML(Typhoeus::Request.get(url).body)

    if img = document.at_css('.comic-item-container .comic-item .img-comic-container img.img-comic')
      description = "#{img[:alt]}\n#{img[:src]}.gif"
      message.say(description)
    end
  end
end

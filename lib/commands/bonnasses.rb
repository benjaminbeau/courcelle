# -*- encoding : utf-8 -*-
require 'typhoeus'
require 'nokogiri'

class Bonnasses < Flower::Command
  respond_to "bonnasse", "soeur", "sœur"#, "bonnasses"

  URLS = %w(
    http://www.bonjourmadame.fr/random
    http://whatisnsfw.tumblr.com/random
  )

  def self.description
    "Des bonnasses ?"
  end

  def self.respond(message)
    if message.command == "bonnasses"
      images = []
      4.times do
        images << image
      end
      message.say images.join("\n")
      p images.join("\n")
    else
      message.say(image)
    end
  end

  def self.image
    url = URLS.sample
    document = Nokogiri.HTML(Typhoeus::Request.get(url, :followlocation => true).body)
    if img = document.at_css(".post img")
      img.attribute('src').value
    end
  end
end

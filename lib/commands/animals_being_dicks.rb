# -*- encoding : utf-8 -*-
require 'typhoeus'
require 'nokogiri'
class AnimalsBeingDicks < Flower::Command
  respond_to "dicks", "animals", "abd"
  URL = "http://animalsbeingdicks.com/random"

  def self.description
    "Post a random animals being dicks gif"
  end

  def self.respond(message)
    message.say(image)
  end

  def self.image
    document = Nokogiri.HTML(Typhoeus::Request.get(URL, :followlocation => true).body)
    document.at_css(".post img").attribute('src').value
  end
end

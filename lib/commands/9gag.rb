# -*- encoding : utf-8 -*-
require 'typhoeus'

class NineGag < Flower::Command
  respond_to "9gag"

  def self.respond(message)
    url = "http://9gag.com/random"
    document = Nokogiri.HTML(Typhoeus::Request.get(url, followlocation: true).body)
    img = document.at_css(".badge-item-img")
    message.say img.attribute('src').value
  end
end

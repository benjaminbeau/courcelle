# -*- encoding : utf-8 -*-
require 'typhoeus'
require 'nokogiri'

class Weekend < Flower::Command
  respond_to "weekend"

  def self.description
    "Est-ce que c'est bientôt le weekend ?"
  end

  def self.respond(message)
    url = "http://estcequecestbientotleweekend.fr/"
    document = Nokogiri.HTML(Typhoeus::Request.get(url).body)
    if msg = document.at_css("p.msg")
      message.say(msg.text.strip!)
    end
  end
end

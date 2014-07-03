# -*- encoding : utf-8 -*-
require 'typhoeus'
require 'nokogiri'

class Mep < Flower::Command
  respond_to 'mep', 'MEP', 'mep?'

  def self.respond(message)
    url = "http://www.estcequonmetenprodaujourdhui.info/"
    doc = Nokogiri.HTML(Typhoeus::Request.get(url, :followlocation => true).body)
    text = []
    text << doc.at_css("body h1").text unless doc.at_css("body h1").nil?
    text << doc.at_css("body p").text unless doc.at_css("body p").nil?
    text << doc.at_css("body img").attribute('src').value

    message.say(text.join("\n"))
  end
end

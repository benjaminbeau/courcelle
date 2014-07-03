# -*- encoding : utf-8 -*-
require 'typhoeus'
require 'nokogiri'
class Asiat < Flower::Command
  respond_to "asiat"

  TAM_NICKS = %w{ Tam TheKorean TheChinese }
  listen_to "ma copine", /copine de (#{TAM_NICKS.join('|')})/

  URL = "http://bonjourlasiat.tumblr.com/random"

  def self.description
    "Des asiat"
  end

  def self.respond(message)
    message.say(image)
  end

  def self.listen(message)

    case
    when message.message =~ /ma copine/i
      message.say(image) if TAM_NICKS.include? message.sender[:nick]
    when message.message =~ /copine de (#{TAM_NICKS.join('|')})/i
      message.say(image)
    end
  end

  def self.image
    document = Nokogiri.HTML(Typhoeus::Request.get(URL, followlocation: true).body)
    if img = document.at_css(".post img")
      img.attribute('src').value
    else
      image
    end
  end
end

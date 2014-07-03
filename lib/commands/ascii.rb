# -*- encoding : utf-8 -*-
require 'typhoeus'
require 'open-uri'
class Ascii < Flower::Command
  respond_to 'ascii'

  def self.respond(message)
    text = message.argument
    url = "http://asciime.heroku.com/generate_ascii?s=#{URI::encode text}"
    ascii = Typhoeus::Request.get(url).body
    message.paste(ascii)
  end
end

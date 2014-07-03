# -*- encoding : utf-8 -*-
require 'open-uri'

class Lmgtfy < Flower::Command
  respond_to "lmgtfy"

  def self.description
    "Let me Google that for you"
  end

  def self.respond(message)
    message.say("http://lmgtfy.com/?q=#{URI::encode message.argument}")
  end
end

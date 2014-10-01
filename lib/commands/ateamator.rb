# -*- encoding : utf-8 -*-
class Ateamator < Flower::Command
  respond_to "ateamator"

  def self.description
    "Ateamator"
  end

  def self.respond(message)
	message.say("http://192.168.3.188:8080")
  end
end

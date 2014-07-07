# -*- encoding : utf-8 -*-
class Ping < Flower::Command
  respond_to "ping"

  def self.description
    "Pong!"
  end

  def self.respond(message)
    if message.command == "ping"
      message.say(PHRASES.sample, :mention => message.user_id)
    else
      message.say(PHRASES.sample + " Try `help`.", :mention => message.user_id)
    end
  end

  PHRASES = [
    "ping pong tching tchong",
  ]
end

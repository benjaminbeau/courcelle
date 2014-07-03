# -*- encoding : utf-8 -*-
require 'typhoeus'
require 'open-uri'
class Achievement < Flower::Command
  respond_to 'achievement'

  def self.description
    description = <<-HERE
Affiche unne succès XBox avec un message personnalisable
usage : !achievement [message]
    HERE
    return description
  end

  def self.respond(message)
    caption = message.argument
    achievement_url = "http://achievement-unlocked.heroku.com/xbox/#{URI::encode caption}.png"
    message.say(achievement_url)
  end
end

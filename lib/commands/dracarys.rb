# -*- encoding : utf-8 -*-
class Dracarys < Flower::Command
  respond_to "dracarys"

  def self.description
    "Dracarys"
  end

  def self.respond(message)
	imgs=["http://media.giphy.com/media/ESgYN7LGXgIO4/giphy.gif",
        "http://media.giphy.com/media/17KRDlheRNADS/giphy.gif",
  "http://media.giphy.com/media/6UWZ61yysjnjy/giphy.gif"]
	message.say(imgs.sample)
  end
end

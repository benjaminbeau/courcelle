# -*- encoding : utf-8 -*-
class Flou < Flower::Command
  respond_to "flou"

  def self.description
    "Flou"
  end

  def self.respond(message)
	imgs=["http://static3.businessinsider.com/image/526e70dbecad040247237811-550-478/screen%20shot%202013-10-28%20at%2010.12.15%20am.png"]
   message.say(imgs.sample)
  end
end

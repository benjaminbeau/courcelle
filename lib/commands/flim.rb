# -*- encoding : utf-8 -*-
class Flim < Flower::Command
  respond_to "flim"

  def self.description
    "Flim"
  end

  def self.respond(message)
	imgs=["http://i62.tinypic.com/bjagli.jpg","http://ljdchost.com/CzDea11.gif"]
   message.say(imgs.sample)
  end
end

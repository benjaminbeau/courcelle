# -*- encoding : utf-8 -*-
class Augustin < Flower::Command
  respond_to "augustin"

  def self.description
    "Augustin"
  end

  def self.respond(message)
	imgs=["http://i57.tinypic.com/28mekcy.gif","http://i59.tinypic.com/24w7r6b.jpg"]
   message.say(imgs.sample)
  end
end

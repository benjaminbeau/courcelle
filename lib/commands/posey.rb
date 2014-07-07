# -*- encoding : utf-8 -*-
class Posey < Flower::Command
  respond_to "posey"

  def self.description
    "Posey"
  end

  def self.respond(message)
	imgs=[
"http://i61.tinypic.com/2ywfvgk.jpg"]
   message.say(imgs.sample)
  end
end

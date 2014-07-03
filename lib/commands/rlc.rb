# -*- encoding : utf-8 -*-
class Rlc < Flower::Command
  respond_to "rlc"

  def self.description
    "RLC"
  end

  def self.respond(message)
	imgs=[
"http://i58.tinypic.com/30ixa2p.jpg", 
"http://i57.tinypic.com/w1r21h.jpg",
"http://i59.tinypic.com/dgjvci.jpg"]
	message.say(imgs.sample)
  end
end

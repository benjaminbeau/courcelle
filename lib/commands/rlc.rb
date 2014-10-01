# -*- encoding : utf-8 -*-
class Rlc < Flower::Command
  respond_to "rlc"

  def self.description
    "RLC"
  end

  def self.respond(message)
	imgs=[
"http://i57.tinypic.com/w1r21h.jpg",
"http://reho.st/http://37.media.tumblr.com/tumblr_m9k19ecITL1qcpdh0o1_400.jpg",
"http://i59.tinypic.com/dgjvci.jpg"]
	message.say(imgs.sample)
  end
end

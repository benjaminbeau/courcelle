# -*- encoding : utf-8 -*-
class Ben < Flower::Command
  respond_to "ben"

  def self.description
    "Ben"
  end

  def self.respond(message)
	imgs=["http://i58.tinypic.com/juivc6.jpg","http://i59.tinypic.com/2lm7yc4.jpg"]
	message.say(imgs.sample)
  end
end

# -*- encoding : utf-8 -*-
class Charles < Flower::Command
  respond_to "charles"

  def self.description
    "Charles"
  end

  def self.respond(message)
	imgs=["http://i60.tinypic.com/t6qgjo.jpg"]
   message.say(imgs.sample)
  end
end

# -*- encoding : utf-8 -*-
class Loic < Flower::Command
  respond_to "loic"

  def self.description
    "loic"
  end

  def self.respond(message)
    imgs=["http://i61.tinypic.com/33us8at.jpg"]
    message.say(imgs.sample)
  end
end

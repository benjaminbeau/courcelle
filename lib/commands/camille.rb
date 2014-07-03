# -*- encoding : utf-8 -*-
class Camille < Flower::Command
  respond_to "camille"

  def self.description
    "Camille"
  end

  def self.respond(message)
	imgs=["https://www.youtube.com/watch?v=v_1FTno4miM"]
   message.say(imgs.sample)
  end
end

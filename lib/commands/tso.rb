# -*- encoding : utf-8 -*-
class Tso < Flower::Command
  respond_to "tso"

  def self.description
    "tso"
  end

  def self.respond(message)
	imgs=["https://www.youtube.com/watch?v=v_1FTno4miM"]
   message.say(imgs.sample)
  end
end

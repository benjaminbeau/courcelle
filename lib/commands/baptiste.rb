# -*- encoding : utf-8 -*-
class Baptiste < Flower::Command
  respond_to "Baptiste"

  def self.description
    "Baptiste"
  end

  def self.respond(message)
	imgs=["https://www.youtube.com/watch?v=v_1FTno4miM"]
   message.say(imgs.sample)
  end
end

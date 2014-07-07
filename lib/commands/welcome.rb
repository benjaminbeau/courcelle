# -*- encoding : utf-8 -*-
class Welcome < Flower::Command
  respond_to "welcome"

  def self.description
    "Welcome"
  end

  def self.respond(message)
	imgs=["https://www.youtube.com/watch?v=v_1FTno4miM"]
	message.say(imgs.sample)
  end
end

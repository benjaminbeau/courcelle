# -*- encoding : utf-8 -*-
class Yoann < Flower::Command
  respond_to "yoann"

  def self.description
    "Yoann"
  end

  def self.respond(message)
	imgs=[
"http://i61.tinypic.com/2ywfvgk.jpg", 
"http://i61.tinypic.com/2isb4n9.jpg",
"http://i59.tinypic.com/2colgzr.jpg",
"http://2f.img.v4.skyrock.net/2ff/mr-bonhomme/pics/304434105.jpg"]
   message.say(imgs.sample)
  end
end

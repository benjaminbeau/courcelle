# -*- encoding : utf-8 -*-
class Sfd < Flower::Command
  respond_to "sfd"

  def self.description
    "SFD"
  end

  def self.respond(message)
	imgs=["https://www.youtube.com/watch?v=aeePeVUW6-k",
"https://s3.amazonaws.com/giphymedia/media/6EN8Ce5KumE6Y/giphy.gif",
"http://media0.giphy.com/media/xWwlsKhzOtuTu/200.gif",
"http://media2.giphy.com/media/QuQIIEvbjE9r2/200.gif",
"http://media1.giphy.com/media/146BUR1IHbM6zu/200.gif",
"http://ljdchost.com/lAbW178.gif",
"http://ljdchost.com/P0BHoL3.gif",
"http://ljdchost.com/44n2hIw.gif",
":fire::fire::fire::fire::fire::fire:"]
	message.say(imgs.sample)
  end
end

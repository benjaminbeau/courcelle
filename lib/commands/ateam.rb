# -*- encoding : utf-8 -*-
class Ateam < Flower::Command
  respond_to "ateam"

  def self.description
    "Ateam"
  end

  def self.respond(message)
	imgs=[
"http://i58.tinypic.com/2nbx6yw.jpg",
"http://i59.tinypic.com/15mmtmt.jpg",
"http://i57.tinypic.com/28mekcy.gif",
"http://i62.tinypic.com/2vaay40.gif",
"http://i59.tinypic.com/2colgzr.jpg",
"http://i59.tinypic.com/fyeexe.jpg",
"http://i60.tinypic.com/9a96d5.jpg",
"http://i61.tinypic.com/2isb4n9.jpg",
"http://i58.tinypic.com/30ixa2p.jpg",
"http://i60.tinypic.com/119w31j.jpg",
"http://i59.tinypic.com/28gsdio.jpg",
"http://i57.tinypic.com/w1r21h.jpg",
"http://i60.tinypic.com/t6qgjo.jpg",
"http://i59.tinypic.com/dgjvci.jpg",
"http://i61.tinypic.com/28uu538.jpg",
"http://i62.tinypic.com/bjagli.jpg",
"http://i61.tinypic.com/2ywfvgk.jpg",
"https://www.youtube.com/watch?v=v_1FTno4miM"
]
	message.say(imgs.sample)
  end
end

# -*- encoding : utf-8 -*-
class Jimmy < Flower::Command
  respond_to "jimmy"

  def self.description
    "jimmy"
  end

  def self.respond(message)
    imgs=["http://p3.storage.canalblog.com/37/37/263150/10971214.jpg", "http://oi59.tinypic.com/2hygqh.jpg","http://i57.tinypic.com/24x1ftd.jpg",
          "http://i59.tinypic.com/3505onk.jpg","http://i62.tinypic.com/35b5wkp.jpg",
          "Regarde les logs !!!"]
    message.say(imgs.sample)
  end
end

# -*- encoding : utf-8 -*-
class LePot < Flower::Command
  respond_to "posey"

  def self.description
    "Posey"
  end

  def self.respond(message)
   message.reply("http://i61.tinypic.com/2ywfvgk.jpg")
  end
end

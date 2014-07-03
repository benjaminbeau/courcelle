# -*- encoding : utf-8 -*-
class Misc < Flower::Command
  listen_to /coucou/i

  def self.listen(message)
    message.reply("tu veux voir ma bite ?")
  end
end

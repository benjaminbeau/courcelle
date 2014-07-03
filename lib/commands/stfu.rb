# -*- encoding : utf-8 -*-
class Stfu < Flower::Command
  listen_to /dota/i, "LoL", "League of Legends"
  TA_GUEULE_REGEXP = /(ta gueule|tg)\s*courcelle|courcelle[:,\s]\s*(ta gueule|tg)/i
  listen_to TA_GUEULE_REGEXP

  def self.listen(message)
    if message.message =~ TA_GUEULE_REGEXP
      message.reply "suce toi!"
    else
      message.reply "oh ta gueule !"
    end
  end
end

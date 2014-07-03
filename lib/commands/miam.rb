# -*- encoding : utf-8 -*-
class Miam < Flower::Command
  listen_to /miam/i

  def self.description
    "Go manger ?"
  end

  EARLY_MSG = [
    "nan c'est pas encore l'heure!",
    "trop tôt...",
    "noob!",
    "non",
    "mange ton poing, et garde l'autre pour demain"
  ]
  LATE_MSG = [
    "c'est maintenant que tu te réveilles toi?!",
    "trop tard..."
  ]

  def self.listen(message)
    time = Time.now

    if message.nick =~ /flou/
	if time.hour < 12
      	    message.say("Non flou ca marche plus !", tags: 'miam')
      	    return
	end
    end
    if time.hour < 12
      message.say(EARLY_MSG.sample, tags: 'miam')
      return
    end
    if time.hour == 12 or time.hour == 20
      message.say("@all: c'est l'heure de manger !", tags: 'miam')
      return
    end
    message.say LATE_MSG.sample, :mention => message.sender[:id], tags: 'miam'
  end
end

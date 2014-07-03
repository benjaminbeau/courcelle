# -*- encoding : utf-8 -*-
class LePot < Flower::Command
  respond_to "gopot", "pot"

  def self.description
    "C'est le pot ?"
  end

  def self.respond(message)
    time = Time.now

    if time.hour == 18 && time.min < 16
      message.say("@all le pot c'est bientôt ! \\o/")
      return
    end
    if time.hour >= 18 && time.min > 15
      message.say("@all le pot c'est NOW ! \\o/")
      return
    end

    if time.wday != 5
      message.reply("http://i58.tinypic.com/2nbx6yw.jpg")
      return
    end
    if time.hour > 19
      message.reply("il est fini !")
      return
    end
    if time.hour < 18
      message.reply("trop tôt là")
      return
    end
    if time.wday == 5 && time.hour == 18 && time.min < 20
      message.reply("attends encore un peu :)")
      return
    end
    if time.wday == 5 && time.hour == 18 && time.min > 20
      message.say("@all, le pot c'est NOW !")
      return
    end
  end
end

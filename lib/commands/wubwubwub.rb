# -*- encoding : utf-8 -*-
class Wubwubwub < Flower::Command
  respond_to "wubwubwub"

  WUBIMAGES = [
    "http://i.imgur.com/WBjjUAF.gif",
    "http://i.minus.com/i3Ol8sjzF6Dr6.gif",
    "http://static4.fjcdn.com/thumbnails/comments/3846178+_cdaba1d9b636817c363919ec6016eb08.gif"
  ]

  def self.description
    "WubWub"
  end

  def self.respond(message)
    message.say(WUBIMAGES.sample)
  end
end

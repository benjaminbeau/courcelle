# -*- encoding : utf-8 -*-
class Internet < Flower::Command
  respond_to "internet","Internet","interneet","interneeet","interneeeet"

  def self.description
    "Internet"
  end

  def self.respond(message)
    message.say("https://www.youtube.com/watch?v=uK4-nUZiOH4")
  end
end

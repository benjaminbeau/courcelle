# -*- encoding : utf-8 -*-
class God < Flower::Command
  respond_to "godHelp"

  def self.description
    "God help"
  end

  def self.respond(message)
	imgs=["The answer is 42"]
   message.say(imgs.sample)
  end
end

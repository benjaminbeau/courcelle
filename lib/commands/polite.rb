# -*- encoding : utf-8 -*-
class Polite < Flower::Command
  POLITE_REGEXP = /(merci|thanks|thx|tks)[,]*\scourcelle|courcelle[,:]*\s(merci|thanks|thx|tks)/i
  listen_to POLITE_REGEXP

  def self.listen(message)
    message.say(RESPONSES.sample, :mention => message.sender[:id])
  end

  RESPONSES = [
    "Pas de quoi.",
    "tkt",
    "No problem",
    "Tout le plaisir est pour moi",
    "Je t'en prie"
  ]
end

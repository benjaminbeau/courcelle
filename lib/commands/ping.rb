# -*- encoding : utf-8 -*-
class Ping < Flower::Command
  respond_to "ping"

  def self.description
    "Pong!"
  end

  def self.respond(message)
    if message.command == "ping"
      message.say(PHRASES.sample, :mention => message.user_id)
    else
      message.say(PHRASES.sample + " Try `help`.", :mention => message.user_id)
    end
  end

  PHRASES = [
    "Yes, master?",
    "At your service",
    "Unleash my strength",
    "I'm here. As always",
    "By your command",
    "Ready to work!",
    "Yes, milord?",
    "More work?",
    "Ready for action",
    "Orders?",
    "What do you need?",
    "Say the word",
    "Aye, my lord",
    "Locked and loaded",
    "Aye, sir?",
    "I await your command",
    "Your honor?",
    "Command me!",
    "At once",
    "What ails you?",
    "Yes, my firend?",
    "Is my aid required?",
    "Do you require my aid?",
    "My powers are ready",
    "It's hammer time!",
    "I'm your robot",
    "I'm on the job",
    "You're interrupting my calculations!",
    "What is your wish?",
    "How may I serve?",
    "At your call",
    "You require my assistance?",
    "What is it now?",
    "Hmm?",
    "I'm coming through!",
    "I'm here, mortal",
    "I'm ready and waiting",
    "Ah, at last",
    "I'm here",
    "Something need doing?"
  ]
end
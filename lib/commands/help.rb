# -*- encoding : utf-8 -*-

class Help < Flower::Command
  respond_to "help"

  def self.respond(message)
    if message.argument
      message.send_to_inbox(help_command(message.argument) || "nothing found", subject: "Help", tags: "help")
    else
      # message.say("Available commands:")
      message.send_to_inbox(available_commands, subject: "Help", tags: "help")
    end
  end

  def self.description
    "This message"
  end

  private
  def self.available_commands
    Flower::COMMANDS.keys.sort
  end

  def self.help_command(command)
    Flower::COMMANDS[command].description if Flower::COMMANDS.has_key? command
  end
end

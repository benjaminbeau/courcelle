# -*- encoding : utf-8 -*-
class Encule < Flower::Command
  respond_to "encule", "enculé"

  def self.description
    "..."
  end

  def self.respond(message)
    image_url = pick_random_line("extras/encule.txt")
    message.say(image_url)
  end

  def self.pick_random_line(file)
    chosen_line = nil
    File.foreach(file).each_with_index do |line, number|
      chosen_line = line if rand < 1.0/(number+1)
    end
    return chosen_line
  end
end

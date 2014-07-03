# -*- encoding : utf-8 -*-
class Fion < Flower::Command
  respond_to "fion"

  def self.description
    "Asses everywhere!"
  end

  def self.respond(message)
    if message.argument == "d'or"
      image_url = "http://i.imgur.com/cvoHY.jpg"
    else
      image_url = pick_random_line("extras/fion.txt")
    end
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

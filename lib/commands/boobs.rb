# -*- encoding : utf-8 -*-
class Boobs < Flower::Command
  respond_to "boobs"

  def self.description
    "boobs"
  end

  def self.respond(message)
    image_url = pick_random_line("extras/boobs.txt")
    message.say(image_url, tags: "boobs")
  end

  def self.pick_random_line(file)
    chosen_line = nil
    File.foreach(file).each_with_index do |line, number|
      chosen_line = line if rand < 1.0/(number+1)
    end
    return chosen_line
  end
end

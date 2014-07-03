# -*- encoding : utf-8 -*-
require 'typhoeus'

class Xkcd < Flower::Command
  respond_to "xkcd"

  def self.description
    description = <<-HERE
Affiche une image de xkcd.com avec sa description
usage : !xkcd [issue_number]
    HERE
    return description
  end

  def self.respond(message)
    num = message.argument
    if !num.nil?
      num = "#{num}/"
    end
    json_response = Typhoeus::Request.get("http://xkcd.com/#{num}info.0.json").body
    xkcd = JSON.parse(json_response)
    description = "#{xkcd['title']} (#{xkcd['alt']})"
    message.say(description << "\n" << xkcd['img'])
  end
end

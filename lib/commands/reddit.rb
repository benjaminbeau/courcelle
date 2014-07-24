# -*- encoding : utf-8 -*-
require 'typhoeus'

class Reddit < Flower::Command
  respond_to 'r'

  def self.description
    description = <<-HERE
Affiche une image aléatoirement d'un subreddit parmis les plus récentes
usage : !r [subreddit]
    HERE
    return description
  end

  def self.respond(message)
    subreddit = message.argument.split(' ').first
    url = "http://www.reddit.com/r/#{subreddit}.json"
    response = Typhoeus::Request.get(url)
    if message.nick =~ /Alekss/
      message.say("On fait plus dans le crade ici...", tags: 'sorry')
      return
    end
    if response.code != 200
      message.say "Ce subreddit n'existe pas."
      return
    end
    json = JSON.parse(response.body)
    children = json['data']['children']
    images = []
    children.each do |e|
      images << "#{e['data']['url']} - #{e['data']['title']}"
    end
    message.say(images.sample, tags: 'reddit')
  end
end

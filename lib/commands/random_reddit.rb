# -*- encoding : utf-8 -*-
require 'typhoeus'

class Reddit < Flower::Command
  respond_to 'rr'

  def self.description
    description = <<-HERE
Affiche une image aléatoire d'un subreddit aléatoire
usage : !r [subreddit]
    HERE
    return description
  end

  def self.respond(message)
    url = "http://www.reddit.com/r/random"
    response = Typhoeus::Request.get(url)
    subreddit_url = response.headers["Location"]
    response = Typhoeus::Request.get(subreddit_url + ".json")

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

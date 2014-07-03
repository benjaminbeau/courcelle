# -*- encoding : utf-8 -*-
require 'google-search'
module Google
  class Search
    class Image < self
      TYPES = :face, :photo, :clipart, :lineart, :animated
    end
  end
end
class Pic < Flower::Command
  respond_to "pic", "picture", "image", "rpic"

  IMAGE_CACHE = {}

  def self.description
    "Post a picture from search string"
  end

  def self.respond(message)
    begin
      image = search_google message.argument
      message.say(image)
    rescue NoMethodError
      message.say("sorry, no match")
    end
  end

  def self.search_google(query)
    results = Google::Search::Image.new(:query => query).to_a
    url = results.first.uri
    URI.encode url
  end
end

# -*- encoding : utf-8 -*-
require 'typhoeus'

class Giphy < Flower::Command
  TAG_REGEXP = /#[\w\-\_]+/
  listen_to TAG_REGEXP

  GIPHY_URL = "http://api.giphy.com/v1/gifs/search?limit=10"
  API_KEY   = "&api_key=dc6zaTOxFJmzC"

  def self.listen(message)
    query     = message.message.scan(TAG_REGEXP).first.gsub(/#/, '')
    response  = Typhoeus::Request.get(GIPHY_URL + "&q=#{query}" + API_KEY)
    gif_data  = JSON.parse(response.body)

    return if gif_data['data'].nil? || gif_data['data'].size < 1

    image_url = gif_data['data'].sample['images']['original']['url']
    message.say(image_url)
  end

end

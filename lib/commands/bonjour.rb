# -*- encoding : utf-8 -*-
require 'typhoeus'
require 'nokogiri'

class Bonjour < Flower::Command
  respond_to "bonjour", "aurevoir"

  def self.description
    description = <<-HERE
Affiche l'image du Bonjour Madame du jour ou d'autres sites similaires
usage : !bonjour [madame]
    HERE
    return description
  end

  def self.respond(msg)
    # url = nil
    case msg.argument
    when "madame"
      url = "http://www.bonjourmadame.fr/"
      url = "http://www.aurevoirmadame.fr/" if msg.command == "aurevoir"

    when "mademoiselle"
      url = "http://www.bonjourmademoiselle.fr/"

    when "l'asiat"
      url = "http://www.bonjourlasiat.fr/"

    when "le cul"
      url = "http://bonjourlecul.fr/"

    when "le chat"
      url = "http://bonjourlechat.tumblr.com/"

    when "la geek"
      url = "http://geexy.fr/"

    when "suceuse"
      url = "http://bonjoursuceuse.tumblr.com/"

    when "salope"
      url = "http://bonjoursalope.tumblr.com/"
    end
    msg.say image(url)
  end

  def self.image(url)
    document = Nokogiri.HTML(Typhoeus::Request.get(url, :followlocation => true).body)
    if img = document.at_css(".post img")
      img.attribute('src').value
    end
  end
end

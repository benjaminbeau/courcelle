# -*- encoding : utf-8 -*-
require 'typhoeus'
require 'nokogiri'

class Fcappelle < Flower::Command
  respond_to "maitreCapello"

  def self.description
    description = <<-HERE
Affiche l'image du Bonjour Madame du jour ou d'autres sites similaires
usage : !maitreCapello
    HERE
    return description
  end

  def self.respond(msg)
    url = %w( http://www.biblestudytools.com/topical-verses/strength-bible-verses/ http://www.biblestudytools.com/topical-verses/encouraging-bible-verses/ ).sample
    msg.say image(url)
  end

  def self.image(url)
    document = Nokogiri.HTML(Typhoeus::Request.get(url, :followlocation => true).body)
    msg = document.css(".ResultText").to_a.sample
    msg.text
  end
end

# -*- encoding : utf-8 -*-
require 'typhoeus'
require 'typhoeus'

class CommitStrip < Flower::Command
  respond_to "commitstrip"

  def self.description
    description = <<-HERE
Affiche le dernier commitstrip.com avec sa description
usage : !commitstrip
    HERE
    return description
  end

  def self.respond(message)
    commitstrip_url = "http://www.commitstrip.com/fr/"

    document = Nokogiri.HTML(Typhoeus::Request.get(commitstrip_url).body)
    title = document.at_css('h1.entry-title a').text

    if img = document.at_css('.post .entry-content p img')
      description = "#{title} (#{img[:src]})"
      message.say(description)
    end
  end
end

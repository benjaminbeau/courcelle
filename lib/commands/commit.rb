# -*- encoding : utf-8 -*-
require 'typhoeus'
class Commit < Flower::Command
  respond_to "commit"

  def self.description
    "Displays a random commit message"
  end

  def self.respond(message)
    message.paste commit_message
  end

  def self.commit_message
    Typhoeus::Request.get("http://whatthecommit.com/index.txt").body
  end
end

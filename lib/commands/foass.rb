# -*- encoding : utf-8 -*-
require 'typhoeus'

class Foaas < Flower::Command
  respond_to "foaas"

  FOAAS_URL = "http://foaas.herokuapp.com"

  def self.respond(message)
    request   = FOAAS_URL.clone
    arguments = message.argument.split(' ')
    cmd       = arguments.first
    sender    = message.sender[:nick]

    case cmd
    when "this", "that", "everyone", "everything", "pink", "life", "thanks", "flying", "fascinating"
      request << '/' << cmd << '/' << sender
    when "off", "you", "donut", "linus", "shakespeare", "king", "chainsaw"
      victim = arguments.last
      return if victim =~ /flou|lou/i
      request << '/' << cmd << '/' << victim << '/' << sender
    else
      return if cmd =~ /flou|lou/i
      request << '/' << cmd << '/' << sender
    end

    msg = JSON.parse(Typhoeus::Request.get(request, headers: { Accept: "application/json" } ).body)
    message.say(msg['message'] << "\n" << msg['subtitle'])
  end
end

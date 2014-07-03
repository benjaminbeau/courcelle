# -*- encoding : utf-8 -*-
class Ben < Flower::Command
  respond_to "ben"

  def self.description
    "Ben"
  end

  def self.respond(message)
	imgs=["http://quoteclub.org/wp-content/uploads/2014/04/if-you-pay-peanuts-you-get-monkeys-James-Goldsmith.jpg"]
	message.say(imgs.sample)
  end
end

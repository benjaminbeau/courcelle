# -*- encoding : utf-8 -*-
class SansAgression < Flower::Command
  respond_to "sansagression"
  DEFAULT_MESSAGE = "la prochaine fois que le plan de taggage GA passe en débug sur la prod, il faudra le faire de façon plus furtive, à moins de vouloir perdre le-dit plan de taggage!"

  def self.respond(message)
    message.say build_message(message.argument)
  end

  private
    def self.build_message(text)
      text = DEFAULT_MESSAGE if text.nil?
      "@everyone, sans agression aucune, #{text}"
    end
end

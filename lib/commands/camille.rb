# -*- encoding : utf-8 -*-
class Camille < Flower::Command
  respond_to "camille"

  def self.description
    "Camille"
  end

  def self.respond(message)
    imgs=["surement habitué a manger de la teub au petit dej", "avant d'étouffer et mourir dans ton vomi",
          "en maths on utilise que x et y par consequent a et b c'est faux","j'ai pas vu la tortue geniale par consequent ca ne peut qu'etre un fake"]
	message.say(imgs.sample)
  end
end

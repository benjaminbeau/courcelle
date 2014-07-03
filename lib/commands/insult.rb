# -*- encoding : utf-8 -*-
class Insult < Flower::Command
  respond_to "insult", "insulte"

  def self.respond(message)
    victim = message.argument
    insult = INSULTS.sample.gsub(/{victim}/, victim).gsub(/{sender}/, message.sender[:nick])
    message.say(insult) unless victim =~ /flou|lou|all|everyone/i
  end

  INSULTS = [
    "{victim} en a une toute petite",
    "{victim} vtfe !",
    "{victim}, va t'occuper de tes JIRA",
    "{victim} mange le caca de @{sender}",
    "{victim} aime le caca",
    "{victim}, on va t'faire chier tes dents",
    "oui, je t'encule {victim}, je te prends, je te retourne contre le mur, je te baise par tous les trous, je te défonce, je te mets !",
    "{victim}, casse toi pov'con",
    "{victim}, pauvre imbécile",
    "{victim}, alors bas du cul, on se laisse pousser les jambes ?",
    "hey {victim}, avec ton coup de soleil sur le nez, quand tu ris ça fait un peu poivrot",
    "Ho le Pti {victim} il a été transformé en boule de merdasse !!!!",
    # "{victim}, espèce de vieille crapule puante, tu ressembles à un debile qui se chie dessus, je bande à l'idée de te chier dessus sous la lune pendant les pubs. Va te faire foutre, Signé : @{sender}",
    # "{victim}, espèce de vieux batard des bois, tu ressembles à un gland toujours prêt à lécher le cul, je rêve de te péter dessus au boulot en baisant ta copine. Va te faire sucer, Signé : @{sender}.",
    "{victim}, va te faire sodomiser par un babouin enceinte et te faire remplir le cul par une colonie de fourmis."
  ]

end

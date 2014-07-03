# -*- encoding : utf-8 -*-
class MrMme < Flower::Command
  respond_to "mrmme"

  def self.description
    "mrmme"
  end

  def self.respond(message)
	imgs=[
"http://staloa.free.fr/images/Mr%20Bonhomme/autoritaire.jpg",
"http://www.nintendo-master.com/galerie/upload/data/7b8aa7d4d9186df1f44dbca9dca4216b.jpg",
"http://static.fnac-static.com/multimedia/images_produits/ZoomPE/8/5/4/9782012248458.jpg",
"https://www.flowdock.com/rest/files/28142/No7oxrHw8za73WdL9O_tkQ/6a00d83451f4e569e2011571a2bcfb970b.jpg",
"http://1dex.ch/wp-content/uploads/2014/06/monsieur-madame.jpg",
"http://13.img.v4.skyrock.net/134/chepa83/pics/716565254_small.jpg",
"http://i45.servimg.com/u/f45/11/05/66/36/mrporn10.jpg",
"http://i45.servimg.com/u/f45/11/05/66/36/mrconn10.jpg",
"http://auto.img.v4.skyrock.net/9924/70199924/pics/3012738945_1_3_sZEHx94h.gif",
"http://2f.img.v4.skyrock.net/2ff/mr-bonhomme/pics/304434105.jpg"]

   message.say(imgs.sample)
  end
end

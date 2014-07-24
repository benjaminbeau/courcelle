# -*- encoding : utf-8 -*-
class Sfw < Flower::Command
  respond_to "sfw"

  def self.description
    "Safe for work"
  end

  def self.respond(message)

	imgs=["http://flaubert.univ-rouen.fr/bovary/bovary_6/notices/sacre-co.jpg",
"http://bellesignature.b.e.pic.centerblog.net/49efcc2a.gif",
"http://petitemimine.p.e.pic.centerblog.net/fflxfafy.jpg",
"http://www.le-mammouth-dechaine.fr/Ndj/files/sixtine.jpg",
"http://bellesignature.b.e.pic.centerblog.net/cb27c5ee.jpg",
"http://mercy.e-monsite.com/medias/album/image-pieuse-marie-enfant-parousie-over-blog-fr.jpg",
"http://img4.hostingpics.net/pics/845967Animation5gif.gif",
"http://pupuce67.p.u.pic.centerblog.net/83301617.jpg",
"http://static.holyart.it/bmz_cache/c/image-pieuse-notre-dame-de-la-tendresse_c87f856ca236c74c5e9ac3f26a0064dd.image.330x330.jpg",
"http://rosedesvent.r.o.pic.centerblog.net/20f6e7a4.jpg"]
	message.say(imgs.sample)
  end
end

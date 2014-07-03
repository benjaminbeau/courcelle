# -*- encoding : utf-8 -*-
require 'typhoeus'
require 'date'
require 'cgi'

class Imdb < Flower::Command
  respond_to 'movie'
  listen_to "imdb.com"

  IMDB_API_URL = "http://mymovieapi.com"
  MOVIES_COUNT = 10

  def self.description
    description = <<-HERE
Récupère les infos d'un film sur Imdb
usage : !movie [title]
    HERE
    return description
  end

  def self.respond(message)
    movie = find_movies(message.argument)

    message.send_to_inbox(movie, subject: "Movie search : #{message.argument}", tags: 'movie')
  end

  def self.listen(message)
    movie = find_movie(message.message)
    message.say(movie, tags: 'movie')
  end

  private

    def self.find_movies(mov)
      url = "#{IMDB_API_URL}/?q=#{CGI::escape mov}&limit=#{MOVIES_COUNT}&mt=M"
      json = JSON.parse(Typhoeus::Request.get(url).body)

      return "Movie not found" if json['code'] && json['code'] == '404'

      movies = []
      json.each { |m| movies << build_movie(m) }
      return movies.join("\n")
    end

    def self.find_movie(mov)
      mov.scan(/(tt\d+)/)
      url = "#{IMDB_API_URL}/?id=#{$1}"
      json = JSON.parse(Typhoeus::Request.get(url).body)
      return build_movie(json)
    end

    def self.build_movie(json)
      title    = json['title']
      year     = json['year']
      plotline = json['plot_simple']
      poster   = json['poster']['imdb'] if json['poster']
      rating   = "[#{json['rating']}/10]" if json['rating']
      director = "Directed by #{json['directors'].join(', ')}" if json['directors']
      released = ", released #{DateTime.parse(json['release_date'].to_s).to_date.to_s}" if json['release_date']
      aka      = "aka #{json['also_known_as'].join(',')}" if json['also_known_as']

      movie = "▶ #{title} (#{year}), #{rating}\n"
      movie << plotline << "\n" if plotline
      movie << "#{director}#{released}"
      movie << "\n#{poster}" if poster

      return movie
    end
end

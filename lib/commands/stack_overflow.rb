# -*- encoding : utf-8 -*-
require 'typhoeus'

class StackOverflow < Flower::Command
  respond_to "q"

  def self.description
    description = <<-HERE
Ask question to Stack Overflow
usage : !q [question]
    HERE
    description
  end

  def self.respond(message)
    message.paste(answer(message.argument))
  end

  def self.answer(query)
    query = URI.escape(query)
    search_url = "https://api.stackexchange.com/2.1/search/advanced?order=desc&sort=relevance&site=stackoverflow&q=#{query}"
    response = Typhoeus::Request.get(search_url, accept_encoding: 'gzip')
    questions = JSON.parse(response.body)["items"]
    flower_answer = []
    if questions.length > 0
        questions[0..2].each do |question|
            title = question['title'].gsub(/[^0-9a-z\?\! ]/i, '')
            flower_answer << "# #{title}"
            flower_answer << question['link']
        end
        flower_answer
    else
        ["No answer found. Google it -> https://www.google.com/search?q=#{query}"]
    end
  end
end

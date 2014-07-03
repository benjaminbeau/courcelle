# -*- encoding : utf-8 -*-
class Whois < Flower::Command
  respond_to 'whois'

  def self.description
    description = <<-HERE
Ask question to Stack Overflow
usage : !whois [username]
    HERE
    description
  end

  def self.respond(message)
    @user_list ||= message.flower.users
    user = whois(message.argument.chomp)
    avatar = user[:avatar][0...-1] << '.png'

    msg = avatar << " "
    msg << user[:name] << " : "
    msg << user[:email] << "\n"
    message.say msg
  end

  private
    def self.whois(user_nick)
      user = @user_list.select { |u| @user_list[u][:nick] == user_nick }
      return user.flatten.last
    end
end


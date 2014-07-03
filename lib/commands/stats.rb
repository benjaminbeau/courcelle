# -*- encoding : utf-8 -*-
class Stats < Flower::Command
  respond_to "stats", "leaderboard"

  def self.description
    description = <<-HERE
Affiche les statistiques d'utilisation
usage : !leaderboard
        !stats commands
        !stats cmd [username]
    HERE
    return description
  end

  def self.respond(message)
    if message.command == "leaderboard"
      message.send_to_inbox(leaderboard_stats, subject: "Leaderboard")
    else
      arguments = message.argument.split(' ')
      case arguments.first
      when "cmd"
        nick = arguments.last
        message.send_to_inbox(["Top 10 for #{nick}"] << command_stats_for(nick), subject: "Top 10 for #{nick}")
      when "commands"
        nick = message.sender[:nick]
        message.send_to_inbox(["Top 10 for #{nick}"] << command_stats_for(nick), subject: "Top 10 for #{nick}")
      end
    end
  end

  def self.description
    "Online right now"
  end

  private

  def self.command_stats_for(nick)
    stats = Flower::Stats.command_stats_for(nick)
    response = stats.map { |type, value| "#{type}: #{value}" }.take(10)
    response << "total: #{stats.map{|s| s[1] }.inject(:+) || 0}"
  end

  def self.leaderboard_stats
    stats = Flower::Stats.leaderboard
    stats.map { |nick, value, diff| "#{arrow(diff)} #{nick}: #{value}" }
  end

  def self.arrow(diff)
    if diff > 0
      diff > 5 ? "↑" : "↗"
    elsif diff < 0
      diff < -5 ? "↓" : "↘"
    else
      "→"
    end
  end
end

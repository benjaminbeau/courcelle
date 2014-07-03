# -*- encoding : utf-8 -*-
require 'typhoeus'
class Flower::Rest

  def initialize
    @flows = {}
    Flower::Config.flows.each do |hash|
      @flows[hash['name']] = hash['token']
    end
  end

  def post_message(message, tags, flow)
    message = {
      content: message,
      tags: tags.join(','),
      # tags: "tag,test,test2",
      event: 'message',
      external_user_name: Flower::Config.bot_nick
    }
    Typhoeus::Request.post(post_flow_url(flow), {params: message})
  end

  def post_to_inbox(message, tags, subject = "Notice", flow)
    message = {
      source: "Flow",
      from_address: "fluby@ekino.com",
      from_name: "Flowbot",
      tags: tags.join(','),
      subject: subject,
      content: message
    }
    Typhoeus::Request.post(post_inbox_url(flow), {params: message})
  end

  def get_users
    response = Typhoeus::Request.get(users_flow_url)
    # JSON.parse(response.body)["users"]
    JSON.parse(response.body)
  end

  private

    def post_flow_url(flow)
      "https://api.flowdock.com/v1/messages/chat/#{@flows[flow]}"
    end

    def post_inbox_url(flow)
      "https://api.flowdock.com/v1/messages/team_inbox/#{@flows[flow]}"
    end

    def flow_url(flow = Flower::Config.flows.first['name'])
      "https://#{Flower::Config.api_token}@api.flowdock.com/flows/#{Flower::Config.company}/#{flow}"
    end

    def users_flow_url
      # "https://#{Flower::Config.api_token}@api.flowdock.com/flows/#{Flower::Config.company}/main"
      # "https://5f5fd66596934e829f6471956ff41370@api.flowdock.com/users"
      "https://#{Flower::Config.api_token}@api.flowdock.com/users"
    end

    def post_url(flow)
      "#{flow_url(flow)}/messages"
    end
end

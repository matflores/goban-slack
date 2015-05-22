require "net/http"
require "json"

module Slack
  def self.post(payload)
    uri = URI(ENV.fetch("SLACK_URL"))
    Net::HTTP.post_form(uri, payload: payload.to_json)
  end
end

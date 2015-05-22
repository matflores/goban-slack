require "cuba"
require "rack/protection"

require_relative "lib/goban"
require_relative "lib/slack"

Cuba.define do
  on post, "boards" do
    puts req.params.inspect

    board_url = Goban.create

    payload = {
      channel:    "#test-integrations",
      username:   "Goban",
      icon_emoji: ":black_circle:",
      text:       board_url
    }

    Slack.post(payload)
  end
end

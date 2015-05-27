require "cuba"
require "rack/protection"

require_relative "lib/goban"
require_relative "lib/slack"

DEFAULT_BOARD_SIZE = 19
VALID_BOARD_SIZES  = [9, 13, 19]

Cuba.define do
  def forbidden!
    res.status = 403
    halt res.finish
  end

  on post, "boards" do
    forbidden! unless req.params["token"] == ENV.fetch("SLACK_TOKEN")

    board_size = req.params["text"].to_i
    board_size = DEFAULT_BOARD_SIZE if board_size == 0

    if VALID_BOARD_SIZES.include?(board_size)
      board_url = Goban.create(board_size)

      payload = {
        channel:    req.params["channel_id"],
        username:   "Goban",
        icon_emoji: ":black_circle:",
        text:       "#{req.params["user_name"]} started a new game: <#{board_url}>"
      }

      Slack.post(payload)

      res.status = 200
    else
      res.write("Invalid board size: #{board_size}. Valid board sizes are #{VALID_BOARD_SIZES.join(", ")}.")
    end
  end
end

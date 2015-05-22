require "net/http"

module Goban
  def self.create
    uri  = URI("http://goban.co/boards")
    res  = Net::HTTP.post_form(uri, "board[hash]" => "")
    json = JSON.parse(res.body)

    "http://goban.co/boards/p/#{json["hash"]}"
  end
end

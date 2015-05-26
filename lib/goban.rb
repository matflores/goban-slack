require "net/http"

module Goban
  def self.create(board_size)
    uri = URI("http://goban.co/boards")

    res = Net::HTTP.start(uri.host, uri.port) do |http|
      headers = { "Content-Type" => "application/json" }
      body    = { board: { size: board_size } }.to_json

      http.post uri.request_uri, body, headers
    end

    json = JSON.parse(res.body)

    "http://goban.co/boards/p/#{json["hash"]}"
  end
end

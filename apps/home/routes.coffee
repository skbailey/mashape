request = require "request"

module.exports = (app) ->

  app.get "/", (req, res) ->
    res.render "#{__dirname}/views/home"

  app.get "/artists/:artist", (req, res) ->
    request
      uri: "https://mager-spotify-web.p.mashape.com/search/1/artist.json?q=#{req.params.artist}"
      headers:
        "X-Mashape-Authorization": "Fdjwqv9HGgTSPv0vG3wRv0uAVj5YiAP2"
      (error, response, body) ->
        console.log error || body
        res.send body
        

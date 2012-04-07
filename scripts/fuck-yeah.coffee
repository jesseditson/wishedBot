escape = require('querystring').escape

# Fuck yeah, fuck yeah!
module.exports = (robot) ->
  robot.respond /fuck yeah?( .*)/i, (msg) ->
    noun = escape(msg.match[1].trim())
    msg.send("http://fuckyeah.herokuapp.com/#{noun}#.jpg")
# Warm me up
module.exports = (robot) ->
  robot.respond /warm me up/i, (msg) ->
    msg.send("https://github.com/broccolini/tumble/raw/master/gifmes/fire.gif")


# what fucking ever who gives a shit
module.exports = (robot) ->
  robot.hear /^(?:what|who|i)(?:\s|ever)(?:the|gives|don't|fucking|cares)?\s?(?:fuck|a|care|ever|give)?\s?(?:a|shit|ever)?\s?(?:shit)?$/i, (msg) ->
    msg.send("http://i.imgur.com/gEfWN.gif")


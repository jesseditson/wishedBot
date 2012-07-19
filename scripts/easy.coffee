# That was easy

module.exports = (robot) ->
  robot.hear /that was easy\s*(\d+)?/i, (msg) ->
    msg.send 'http://i.imgur.com/fXAHu.jpg'
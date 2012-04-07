# Streams in new apartment listings from Craigslist.
#

module.exports = (robot) ->
  robot.respond /(apartment)( me)? (.*)/i, (msg) ->
    msg.http('http://sfbay.craigslist.org/search/apa/sfc?query=&srchType=A&minAsk=1900&maxAsk=3500&bedrooms=1&nh=149&nh=12&nh=10&nh=18&nh=25')
      .get() (err, res, body) ->
        titlePattern = /<a href="http(.+?).html(.+?)a>/ig
        descriptionPattern = /http(.+?).html/i
        linkPattern = />(.+?)<\/a>/i
        count = 0
        while m = titlePattern.exec(body)
          msg.send(linkPattern.exec(m[0])[1] + ' - ' + descriptionPattern.exec(m[0])[0])
          count++
          break if count > 5
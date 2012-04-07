
# Duck face bomber.
#
# duck me               - Displays 10 duck face pictures
#
# duck                  - Alias of above
#
# duck me <number>      - Displays specified number of duck face pictures
#

module.exports = (robot) ->
  duckfaceurl = 'http://ajax.googleapis.com/ajax/services/search/images'
  robot.respond /duck(\s?face)?( me)?\s?(\d)*/i, (msg) ->
    pagenum = Math.floor(Math.random() * 50)
    msg.http(duckfaceurl).query(v: "1.0",rsz: "8",q: "duck+face",imgtype: "face",start: pagenum)
    .get() (err, res, body) ->
      images = JSON.parse(body)
      images = images.responseData.results
      num = parseInt(msg.match[3]) || 10
      while (num > 0)
        image = msg.random images
        msg.send "#{image.unescapedUrl}#.png"
        num = num - 1
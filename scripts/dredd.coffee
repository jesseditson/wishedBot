
# Judge dredd judgements.
#
# pass judgement        - Judge Dredd explains if you are guilty, not guilty, or if he's just the law.
#
# judge, dredd          - Aliases of above
#
# <above> on <username> - Judges that person instead of making arbitrary judgement
#

module.exports = (robot) ->
	robot.respond /(?:pass\s)?judge(?:ment)?(?:\son)?(?:\s([\w\s]+))?$/i, (msg) ->
		dreddArray = [
			"http://themoviebros.files.wordpress.com/2010/11/dredd.jpg",
			"http://information2share.files.wordpress.com/2011/07/wallpaper-74721.jpg",
			"http://cdn.counter-currents.com/wp-content/uploads/2011/07/Judge_Dredd.jpg",
			"http://www.myfreewallpapers.net/comics/wallpapers/judge-dredd-simon-bisley.jpg",
			"http://simonbisleygallery.com/art/biz00157.jpg",
			"http://1.bp.blogspot.com/-rrd743-1srs/TiPgSsDlTGI/AAAAAAAABAs/E6_akmE_KO0/s1600/Sylvester+Stallone+As+Judge+Dredd.jpg"
		]
		user = (msg.match[1] || "YOU").toUpperCase()
		image = msg.random dreddArray
		hasUser = !!msg.match[1]
		r = Math.floor(Math.random() * 9)
		if r <= 3
			verdict = "GUILTY"
		else if r <= 7
			verdict = "NOT GUILTY"
		else
			verdict = "I AM THE LAW"
		if(!hasUser)
			connector = " ARE "
		else
			connector = " IS "
		if verdict != "I AM THE LAW"
			verdict = user + connector + verdict
		msg.http(captionurl(image,verdict))
		.post("") (res, end, body) ->
			json = JSON.parse(body)
			msg.send "http://cheezburger.com" + json.Url + "#.jpg"

captionurl = (img, text) ->
	return "http://cheezburger.com/Builder/GetPreviewUrl/?source=" + encodeURIComponent(img) + "&top=&topAlign=left&middle=&midAlign=left&bottom=" + encodeURIComponent(text) + "&botAlign=left&font=Impact&fontSize=50&fontStyle=outline&fontOpacity=100&fontColor=White&fontBold=true&fontItalic=false&fontUnderlined=false"
# disappoint is disappointed
# these animals are not mad at you, just disappointed.
#
# just say disappoint or disappointed or whatever
#

imgs = ["http://s3-ak.buzzfed.com/static/enhanced/web05/2012/3/15/17/enhanced-buzz-22076-1331845693-1.jpg",
"http://s3-ak.buzzfed.com/static/enhanced/web03/2012/3/15/17/enhanced-buzz-6089-1331845705-2.jpg",
"http://s3-ak.buzzfed.com/static/enhanced/web03/2012/3/15/17/enhanced-buzz-6112-1331845711-0.jpg",
"http://s3-ak.buzzfed.com/static/enhanced/terminal05/2012/3/15/17/enhanced-buzz-8955-1331845716-1.jpg",
"http://s3-ak.buzzfed.com/static/enhanced/web04/2012/3/15/17/enhanced-buzz-12035-1331845734-1.jpg",
"http://s3-ak.buzzfed.com/static/enhanced/web05/2012/3/20/14/enhanced-buzz-31521-1332268591-48.jpg",
"http://s3-ak.buzzfed.com/static/enhanced/web05/2012/3/15/17/enhanced-buzz-22076-1331845755-5.jpg",
"http://s3-ak.buzzfed.com/static/enhanced/web04/2012/3/15/17/enhanced-buzz-12053-1331845773-0.jpg",
"http://s3-ak.buzzfed.com/static/enhanced/web03/2012/3/15/17/enhanced-buzz-6112-1331845779-2.jpg",
"http://s3-ak.buzzfed.com/static/enhanced/terminal05/2012/3/15/17/enhanced-buzz-8923-1331845868-4.jpg",
"http://s3-ak.buzzfed.com/static/enhanced/terminal05/2012/3/15/17/enhanced-buzz-8999-1331845792-3.jpg",
"http://s3-ak.buzzfed.com/static/enhanced/terminal05/2012/3/15/17/enhanced-buzz-8920-1331845902-2.jpg",
"http://s3-ak.buzzfed.com/static/enhanced/terminal05/2012/3/15/17/enhanced-buzz-9035-1331845810-2.jpg",
"http://s3-ak.buzzfed.com/static/enhanced/web05/2012/3/15/17/enhanced-buzz-22099-1331845818-4.jpg",
"http://s3-ak.buzzfed.com/static/enhanced/web03/2012/3/15/17/enhanced-buzz-6121-1331845838-0.jpg",
"http://s3-ak.buzzfed.com/static/enhanced/web05/2012/3/15/17/enhanced-buzz-22099-1331845844-6.jpg",
"http://s3-ak.buzzfed.com/static/enhanced/web03/2012/3/15/17/enhanced-buzz-6052-1331846120-2.jpg",
"http://s3-ak.buzzfed.com/static/enhanced/web03/2012/3/15/17/enhanced-buzz-6121-1331845879-2.jpg",
"http://s3-ak.buzzfed.com/static/enhanced/web05/2012/3/15/17/enhanced-buzz-22109-1331845889-4.jpg",
"http://s3-ak.buzzfed.com/static/enhanced/web05/2012/3/15/17/enhanced-buzz-22086-1331845930-8.jpg",
"http://s3-ak.buzzfed.com/static/enhanced/web04/2012/3/15/17/enhanced-buzz-12009-1331846102-3.jpg",
"http://s3-ak.buzzfed.com/static/enhanced/terminal05/2012/3/15/17/enhanced-buzz-8981-1331845962-8.jpg",
"http://s3-ak.buzzfed.com/static/enhanced/terminal05/2012/3/15/17/enhanced-buzz-9035-1331846002-5.jpg",
"http://s3-ak.buzzfed.com/static/enhanced/terminal05/2012/3/20/14/enhanced-buzz-28727-1332268655-82.jpg",
"http://s3-ak.buzzfed.com/static/enhanced/web05/2012/3/15/17/enhanced-buzz-22093-1331846021-11.jpg",
"http://s3-ak.buzzfed.com/static/enhanced/web03/2012/3/15/17/enhanced-buzz-6089-1331846033-4.jpg",
"http://s3-ak.buzzfed.com/static/enhanced/terminal05/2012/3/15/17/enhanced-buzz-8920-1331846083-4.jpg"]

module.exports = (robot) ->
  robot.hear /(disappoint(ed|ment|ing)?|bumme(d|r))/, (msg) ->
    msg.send msg.random imgs
var http = require('http'),
    https = require('https'),
    fs = require('fs'),
    url = require('url'),
    app = require('express').createServer(),
    sha1 = require('sha1'),
    im = require('imagemagick');

function download(image, output, callback){
  var uri  = url.parse(decodeURIComponent(image)),
      host = uri.hostname,
      path = uri.pathname,
      r;

  if(uri.protocol == "https:"){
    r = https;
  } else {
    r = http;
  }
    
  r.get({host: host, path: path}, function(res){
    res.setEncoding('binary');
    var img = '';

    res.on('data', function(chunk) {
      img += chunk;
    })

    res.on('end', function(){
      fs.writeFile(output, img, 'binary', function (err) {
        if (err) throw err;
        callback();
      })
    })
  })
}

app.all('/:image/:message',function(req,res) {
  var image = req.params.image,
      msg = req.params.message,
      output = "/tmp/" + sha1(image+msg) + '.jpg';
  msg = decodeURIComponent(msg).toUpperCase();
  download(image, output, function(){
    im.identify(output,function(err,features){
      if(err){
        console.error("Error downloading image: %s",err.message);
        res.send(500,'Error: '+err.message);
        return false;
      }
      var h = features.height < 100 ? features.height : 100,
          w = features.width < 500 ? features.width : 500,
          args = [
            '-strokewidth','2',
            '-stroke','black',
            '-background','transparent',
            '-fill','white',
            '-gravity','center',
            '-size',features.width+'x'+features.height,
            "caption:"+msg,
            output,
            '+swap',
            '-gravity','south',
            '-size',features.width+'x',
            '-composite',output
          ];
      im.convert(args, function(){
        fs.readFile(output, function (err, data) {
          if (err) throw err;
          res.header('Content-Type','image/jpeg');
          res.send(data);
        });
      });
    });
  })
})

app.listen(7777);

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
    var args = [
      output,
      '-strokewidth', '2',
      '-stroke', 'black',
      '-fill', 'white',
      '-pointsize', '50',
      '-gravity', 'center',
      '-weight', '800',
      '-resize', '500x',
      '-draw', 'text 0,20 ' + msg,
      output
    ]
    im.convert(args, function(){
      fs.readFile(output, function (err, data) {
        if (err) throw err;
        res.header('Content-Type','image/jpeg');
        res.send(data);
      });
    })
  })
})

app.listen(7777);

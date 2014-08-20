var express = require('express');
var app     = express();

app.set('view engine', 'jade');
app.set('views', __dirname + '/views');

app.use( function (req, res, next) {
  res.locals.catpics = [];
  next();
});

app.get('/', function(req, res) {
  res.render('index');
});

app.get('/cats', function(req, res, next) {
  res.render('allcats');
});

app.post('/cats', function(req, res, next) {

});

app.get('/cats/:user', function(req, res) {
  /*if (user.length < 4) {
    res.render('shortname');
  } else {
    res.render('userscat');
  }*/
});

app.listen(3000);

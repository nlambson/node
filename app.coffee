mongoose = require 'mongoose'
express = require 'express'
request = require 'request'

USER_DB = process.env.USER_DB || 'mongodb://localhost:27017/mydb'
db = mongoose.createConnection USER_DB

Thumbnail = require('./Thumbnail')(db)
Functions = require('./functions')(Thumbnail)

exports.createServer = ->
    app = express.createServer()
    app.use express.bodyParser()
    app.use express.logger('dev')
    app.get '/', Functions.getHome
    app.get '/Import/', Functions.doImport
    app.get '/thumbnailsBetween/start/:someStartTime/end/:someEndTime', Functions.getThumbs

    return app

if module == require.main
  app = exports.createServer()
  PORT = 3000
  console.log "'
  Started on #{PORT}
  '"
  app.listen PORT
request = require 'request'
async = require 'async'

module.exports = (Thumbnail)-> 

    getHome: (req, res) ->
        console.log "getHome::Thumbs = " + Thumbnail
        res.send "Hello Node.js CoffeeScript Express Mongoose and MongoDB"

    doImport: (req, res) ->
        request "http://thumbnails.i.tv/thumbnails/program/sm-4d8dca164ee0cfc3279d79191356237b.2012-12-05", (error, response, body) ->
            if error or response.statusCode is not 200
                return res.send "error"

            obj = JSON.parse(body)

            async.forEach obj, (thumb, ca) ->
                thumbnail = new Thumbnail(thumb)
                console.log thumbnail
                thumbnail.save ca
            , (err) =>
                res.send "you actually finished, seriously" 

    getThumbs: (req, res) ->
        start = req.params.someStartTime
        end = req.params.someEndTime

        Thumbnail.getRange start, end, (err, thumbnails) ->
            return res.json {error: true, message: err.message}, 500 if err?
            res.send thumbnails
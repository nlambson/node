mongoose = require 'mongoose'
Schema = mongoose.Schema
ObjectId = Schema.Types.ObjectId

module.exports = (db) ->

    ThumbnailSchema = new Schema {
        offset: Number
        programId: String
        url: String
        _id: ObjectId
    }

    ThumbnailSchema.statics.getRange = (start, end, cb) ->
        @find({'offset': {$gte: start, $lte: end}}).exec(cb)

    Thumbnail = db.model "Thumbnail", ThumbnailSchema

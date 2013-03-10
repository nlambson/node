#i.TV Demo App

This is a small [express](http://expressjs.com) boilerplate app for i.tv candidates.

## Express
Express is a node http server that makes building RESTFUL JSON apis simple.
See the express docs for more info.


## Setup and Installation
To run the server, you need nodejs and npm installed. See
[http://nodejs.org/](http://nodejs.org/) for installation instructions for
your platform.

Once you have node and npm installed, install the dependencies like so:

```bash
cd boilerplate
npm install
```

This will use npm, the node package manage, to install any dependencies listed
in the project's package.json file. If you want to add more dependencies on
external packages to the server, add them to the `depedencies` array in the
package.json file and run `npm install` again.

(See [here](http://package.json.jit.su/) for a detailed description of the
package.json file.)


### Express Super Quick Overview

The app includes an example route. Express maps HTTP routes to functions in your
app. These route functions look like this:

```JavaScript
app.get('/hurp', function (req, res) {
  res.send('OKAY DUDES');
}
```

This maps a GET request to the path  `/hurp` to this specific handler function.

`req` is the request object. It is how you get information about
the request that triggered the handler. You can use `req.params` to get URL
parameters and `req.query` to get query parameters.

`res` is the response object. It is how you send back data to the client that
made the request. You can use `res.json` to send JSON data back to the client.


### Getting Data From Somewhere Else
[request](https://github.com/mikeal/request) is the most common node http client
library. If you need to request data from a url, you should use `request` to
do so.

## What You Are Building

You will create a server-side application that provides thumbnail data to users.

[http://thumbnails.i.tv/thumbnails/program/sm-4d8dca164ee0cfc3279d79191356237b.2012-12-05](http://thumbnails.i.tv/thumbnails/program/sm-4d8dca164ee0cfc3279d79191356237b.2012-12-05)
returns an array of thumbnail objects. We want you to import this thumbnail
data into some kind of local storage, and create a route on the server that
allows users to query the thumbnail data. You are free to use whatever database
technology you like.


The thumbnail objects look like this:

```JavaScript
{
  "offset": 1234,
  "programId": "en-catinhat-t816yldu-010027",
  "url": "http://s3.amazonaws.com/itv-thumbnails-prod/507d0aaa5a2d0588140003a6-1351258200549.jpeg"
  "_id": "508a905e94f3d99e01007081"
}
```

* `offset` is the number of milliseconds into the show the thumbnail is from
* `programId` is the internal ID we use for the show this thumbnail comes from
* `url` is where the thumbnail is actually stored
* `_id` is an internal ID for this specific thumbnail, and isn't really important

Your route should look like this:

`/thumbnailsBetween/start/:someStartTime/end/:someEndTime`

It should return all thumbnails with an offset greater than or equal to
`someStartTime` and less than or equal to `someEndTime`.

As an example, once your server is up and running, hitting
[http://localhost:3000/thumbnailsBetween/start/1234/end/5678](http://localhost:3000/thumbnailsBetween/start/1234/end/5678)
should return the following JSON:

```JavaScript
[
  {
    offset: 11907,
    programId: "sm-4d8dca164ee0cfc3279d79191356237b.2012-12-05",
    url: "http://s3.amazonaws.com/itv-thumbnails-prod/50944a1b10abbdc7fd001057-1354744811907.jpeg",
    _id: "50bfc3ffef24bcd40800b8c3"
  },
  {
    offset: 15965,
    programId: "sm-4d8dca164ee0cfc3279d79191356237b.2012-12-05",
    url: "http://s3.amazonaws.com/itv-thumbnails-prod/50944a1b10abbdc7fd001057-1354744815965.jpeg",
    _id: "50bfc403ec68b0982b00f0ea"
  },
  {
    offset: 19955,
    programId: "sm-4d8dca164ee0cfc3279d79191356237b.2012-12-05",
    url: "http://s3.amazonaws.com/itv-thumbnails-prod/50944a1b10abbdc7fd001057-1354744819955.jpeg",
    _id: "50bfc407ef24bcd40800b8cc"
  }
]
```


## Questions And Criteria

The code should be your own, but asking for help is expected and encouraged.
Google, the #nodejs IRC channel on irc.freenode.net, or my email (jamison@i.tv)
are fine resources.


Good luck!

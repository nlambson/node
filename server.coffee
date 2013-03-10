#  OpenShift sample Node application
http = require("http")

#Get the environment variables we need.
ipaddr = process.env.OPENSHIFT_NODEJS_IP or "127.0.0.1"
port = process.env.OPENSHIFT_NODEJS_PORT or 8080
http.createServer((req, res) ->
  addr = "unknown"
  out = ""
  if req.headers.hasOwnProperty("x-forwarded-for")
    addr = req.headers["x-forwarded-for"]
  else addr = req.headers["remote-addr"]  if req.headers.hasOwnProperty("remote-addr")
  if req.headers.hasOwnProperty("accept")
    if req.headers["accept"].toLowerCase() is "application/json"
      res.writeHead 200,
        "Content-Type": "application/json"

      res.end JSON.stringify(
        ip: addr
      , null, 4) + "\n"
      return
  res.writeHead 200,
    "Content-Type": "text/plain"

  res.write "Welcome to Node.js on OpenShift!\nThis is the REAL VERSION! Nathan Lambson is the Best!\n"
  res.end "Your IP address seems to be " + addr + "\n"
).listen port, ipaddr
console.log "Server running at http://" + ipaddr + ":" + port + "/"
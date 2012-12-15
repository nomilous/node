express = require 'express'
app     = express()
server  = require('http').createServer(app)
io      = require('socket.io').listen(server)
fs      = require('fs')

app.get '/', (req, res) -> 
    fs.readFile __dirname + '/../index.html', (err, data) ->
        if err
            res.writeHead 500
            res.end 'Error loading index.html'
            return

        res.writeHead 200
        res.end data

module.exports = 
    express: express
    app: app
    server: server
    io: io
    fs: fs

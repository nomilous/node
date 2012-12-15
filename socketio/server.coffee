express = require 'express'
app     = express()
server  = require('http').createServer(app)
io      = require('socket.io').listen(server)
fs      = require('fs')

server.listen 3000

app.get '/', (req, res) -> 

    fs.readFile __dirname + '/index.html', (err, data) ->

        if err

            res.writeHead 500
            res.end 'Error loading index.html'
            return

        res.writeHead 200
        res.end data


    io.sockets.on 'connection', (socket) ->

        socket.emit 'event1', data: 'DATA'


all = require './app/server' 
all.server.listen 3000


all.io.sockets.on 'connection', (socket) ->

    #
    # browser connected
    #

    socket.emit 'event1', data: 'DATA'





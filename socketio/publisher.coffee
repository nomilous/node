all = require './app/server' 
all.server.listen 3000

mux = require './app/mux'

all.io.sockets.on 'connection', mux.client


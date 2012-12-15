all = require './app/server' 
all.server.listen 3000

proxy = require './app/proxy'

proxy.parent.start()

all.io.sockets.on 'connection', proxy.newChild


net = require 'net'

descriptor = '/tmp/mySocket'



#
# delete if already there
#

(require 'fs').unlink descriptor, (err) -> 
    
    unless err

        console.log 'deleted %s', descriptor
        return

    unless err.code == 'ENOENT'

        throw err





server = net.createServer (socket) -> 

    socket.end 'BYE\n'





server.listen '/tmp/mySocket', -> 

    console.log 'server listening at %s', server.address()





server.on 'connection', (socket) -> 

    console.log 'server received connection:', socket



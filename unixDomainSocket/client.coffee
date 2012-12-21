descriptor = '/tmp/mySocket'

socket = new (require 'net').Socket

socket.connect descriptor, -> 

    console.log 'connected', socket
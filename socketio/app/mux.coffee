#
# Multiplexing PubSub Server
#  
# Multiple inbound socket datastreams available 
# for client subscription.
#

mux = 


    #
    # available data streams
    #

    streams: 

        testfeed: 

            id: 'TestServerIdEntity'
            description: 'Test Feed'




    # 
    # connected inbound data feeds
    #

    servers: {}



    #
    # connected subscribers
    # 
    # maintains store of attached clients
    # keyed on their socketio id 
    # 
    # TODO: this will need to move to redis
    #       or something similar to survive
    #       node restart
    # 

    clients: {}




    #
    # client facing interface
    #

    client: (socket) -> 

        #
        # create ref to connected socket 
        #

        mux.clients[ socket.id ] = socket

        socket.emit 'event:connect'

            #
            # At new connect client receives:
            #
            # - it's ID and
            # - the list of datastreams
            #

            id: socket.id
            streams: mux.streams


module.exports = mux

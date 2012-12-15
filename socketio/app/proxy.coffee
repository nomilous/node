#
# n-Tier Proxiing Node 
# 
# - subscription based data distribution
# - data only flows downtree (for now...)
# 

proxy = 


    #
    # available inbound data streams
    #

    streams: 

        testfeed: 

            id: 'TestServerIdEntity'
            description: 'Test Feed'




    # 
    # connected inbound data feed
    # 
 
    parent: 

        #
        # TEMPORARY: parent as datagram socket listener
        # 
        # To send a datagram: 
        # 
        #   MAC: 
        # 
        #     $ echo 'data' | nc -uw 0 0.0.0.0 12345
        # 
        #   Ubuntu:
        # 
        #     $ echo 'data' | nc -uq 0 0.0.0.0 12345
        # 

        server: require( 'dgram' ).createSocket 'udp4'

        onReceive: (msg, rinfo) -> 
            process.stdout.write msg.toString()
 
        onListen: ->
            address = proxy.parent.server.address()
            console.log "listening at #{ address.address }:#{ address.port }"
 
        start: -> 
            proxy.parent.server.on 'message', proxy.parent.onReceive
            proxy.parent.server.on 'listening', proxy.parent.onListen
            proxy.parent.server.bind 12345




    #
    # connected subscribers
    # 
    # maintains store of attached child nodes
    # keyed on their socketio id 
    # 
    # TODO: this will need to move to redis
    #       or something similar to survive
    #       node restart
    # 

    children: {}




    #
    # client facing interface
    #

    newChild: (socket) -> 

        #
        # create ref to connected child socket 
        #

        proxy.children[ socket.id ] = socket

        socket.emit 'event:connect'

            #
            # At new connect client receives:
            #
            # - it's ID and
            # - the list of datastreams
            #

            id: socket.id
            streams: proxy.streams


module.exports = proxy

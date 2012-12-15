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

    parent: {}



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

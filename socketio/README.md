```bash 

npm install coffee-script -g  # unless already
npm install

```


Client
------

[localhost:3000](http://localhost:3000/)


Connects to
-----------

### Basic Server

```bash 

coffee server

```


### Broadcaster

```bash

#
# start broadcast server
#

coffee broadcaster


```

* Each attached [browser](http://localhost:3000/) receives datagram
* ALT^CMD^i (Chrome) starts console.log in browser


```bash

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

```


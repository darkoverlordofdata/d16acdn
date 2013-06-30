#+--------------------------------------------------------------------+
#| d16acdn.coffee
#+--------------------------------------------------------------------+
#| Copyright DarkOverlordOfData (c) 2012 - 2013
#+--------------------------------------------------------------------+
#|
#| This file is a part of d16acdn
#|
#| D16acdn is free software; you can copy, modify, and distribute
#| it under the terms of the MIT License
#|
#+--------------------------------------------------------------------+

#
# Using Versions from NodeJitsu
#
# @see https://github.com/3rd-Eden/versions
#
versions = require('versions')

#
# Base config settings
#
versions.set 'auth', process.env.CDNKEY || 'd16a'
versions.set 'log level', 'debug'
versions.set 'directory', './public'

#
# Plugins:
#

versions.set 'plugins', [
  { name: 'directory',  config: './public' }
  { name: 'favicon',    config: './public/favicon.png' }
  { name: 'connect-url-rewrite', config: ["^/$", "/index.html"]}
  'directory'
  'favicon'
  'connect-url-rewrite'
]

#
# Origin servers:
#
versions.set 'origin servers', [
  {url: 'http://d16a.aws.af.cm', id: 'd16a'}
#  {url: 'http://exspresso.aws.af.cm', id: 'exspresso'}
]

#
# Sync:
#
###
versions.set 'sync', true

redis = JSON.parse(process.env.VCAP_SERVICES)['redis-2.2'][0]

versions.set 'redis',
  host: redis.credentials.host
  port: redis.credentials.port
  auth: redis.credentials.password
###


#
# Start the server
#
port = process.env.PORT ? 53610
versions.listen port, (err) ->

  if err
    @logger.error '[versions] Failed to start Versions'
  else
    @logger.log '[versions] Started Versions/'+ versions.version+ ' on port '+port



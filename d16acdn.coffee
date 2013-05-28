

versions = require('versions')

port =  process.env.PORT ? 8086

versions.set 'log level', 'debug'

versions.listen port, (err) ->

  if err
    @logger.error '[versions] Failed to start Versions'
  else
    @logger.log '[versions] Started Versions/'+ versions.version+ ' on port '+port

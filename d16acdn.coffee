


versions = require('versions')

port =  process.env.PORT ? 53610

versions.set 'log level', 'debug'
versions.set 'directory', './public'
versions.set 'plugins', [{ name: 'directory', config: './public' }, 'directory']

versions.listen port, (err) ->

  if err
    @logger.error '[versions] Failed to start Versions'
  else
    @logger.log '[versions] Started Versions/'+ versions.version+ ' on port '+port


#
# TODO: use connect directory middleware to sever directory listing
#
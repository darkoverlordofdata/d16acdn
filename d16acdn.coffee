


versions = require('versions')

port =  process.env.PORT ? 53610

versions.set 'log level', 'debug'
versions.set 'directory', './public'
versions.set 'plugins', [
  { name: 'directory',  config: './public' }
  { name: 'favicon',    config: './public/favicon.png' }
  'directory'
  'favicon'
]
versions.set 'origin servers', [
  {url: 'd16a.aws.af.cm', name: 'd16a'}
  {url: 'exspresso.aws.af.cm', name: 'exspresso'}
]

versions.listen port, (err) ->

  if err
    @logger.error '[versions] Failed to start Versions'
  else
    @logger.log '[versions] Started Versions/'+ versions.version+ ' on port '+port


#
# TODO: use connect directory middleware to sever directory listing
#



versions = require('versions')

port =  process.env.PORT ? 53610
versions.set 'auth', process.env.CDNKEY || 'd16a'
versions.set 'log level', 'debug'
versions.set 'directory', './public'
versions.set 'plugins', [
  { name: 'directory',  config: './public' }
  { name: 'favicon',    config: './public/favicon.png' }
  'directory'
  'favicon'
]
versions.set 'origin servers', [
  {url: 'http://d16a.aws.af.cm', id: 'd16a'}
  {url: 'http://exspresso.aws.af.cm', id: 'exspresso'}
]
###
versions.set 'sync', true

redis = process.env.VCAP_SERVICES['redis-2.2']

versions.set 'redis',
  host: redis.credentials.host
  port: redis.credentials.port
  auth: redis.credentials.password
###
versions.listen port, (err) ->

  if err
    @logger.error '[versions] Failed to start Versions'
  else
    @logger.log '[versions] Started Versions/'+ versions.version+ ' on port '+port



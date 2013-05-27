

versions = require('versions')

port =  process.env.PORT ? 3000


versions.listen port, (err) =>
  if (err)
    console.log '[versions] Failed to start Versions'
  else
    console.log '[versions] Started versions/'+ versions.version+ ' on port '+port

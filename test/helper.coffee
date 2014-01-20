fs = require 'fs'
path = require 'path'

exports.readFile = (filename)-> fs.readFileSync(path.join(__dirname, filename)).toString()

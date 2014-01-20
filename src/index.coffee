sjs = require 'sweet.js'

class SweetJSCompiler
  brunchPlugin: yes
  type: 'javascript'

  constructor: (cfg)-> null

  compile: (data, path, callback) ->
    try
      result = sjs.compile data
    catch err
      error = err
    finally
      callback error, result.code

module.exports = SweetJSCompiler

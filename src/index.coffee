sjs = require 'sweet.js'
util = require 'util'

class SweetJSCompiler
  brunchPlugin: yes
  type: 'javascript'
  extension: 'js'

  constructor: (cfg)->
    @options = cfg.plugins?.sweet ? {}
    null

  compile: (data, path, callback) ->
    try
      @options.filename = path if @options.sourceMap?
      sweetResult = sjs.compile data, @options
    catch err
      callback err

    result =
      data: sweetResult.code
      map: sweetResult.sourceMap

    callback null, result

module.exports = SweetJSCompiler

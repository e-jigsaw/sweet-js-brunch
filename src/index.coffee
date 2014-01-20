sjs = require 'sweet.js'

class SweetJSCompiler
  brunchPlugin: yes
  type: 'javascript'
  extension: 'js'

  constructor: (cfg)->
    @options = cfg.plugins?.sweet ? {}
    if @options.modules?
      @options.modules = @options.modules.map (file)-> sjs.loadNodeModule __dirname, file
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

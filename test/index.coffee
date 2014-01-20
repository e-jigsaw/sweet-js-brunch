{expect} = require 'chai'
Plugin = require '../'
fs = require 'fs'
path = require 'path'

describe 'Plugin', ->
  plugin = null
  beforeEach -> plugin = new Plugin({})

  it 'should be an object', -> expect(plugin).to.be.ok
  it 'should has compile method', -> expect(plugin.compile).to.be.an.instanceof(Function)
  it 'should compile valid result', (done)->
    src = fs.readFileSync(path.join(__dirname, 'fixtures/sample.sjs')).toString()
    validResult = fs.readFileSync(path.join(__dirname, 'fixtures/sample.js')).toString()

    plugin.compile src, 'sample.sjs', (err, result)->
      expect(err).not.to.be.ok
      expect(result).to.equal(validResult)
      done()

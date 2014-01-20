{expect} = require 'chai'
Plugin = require '../'
{readFile} = require './helper'

describe 'Plugin', ->
  plugin = null
  beforeEach -> plugin = new Plugin({})

  it 'should be an object', -> expect(plugin).to.be.ok
  it 'should has compile method', -> expect(plugin.compile).to.be.an.instanceof(Function)
  it 'should compile valid result', (done)->
    src = readFile 'fixtures/sample.sjs'
    validResult = readFile 'fixtures/sample.js'

    plugin.compile src, 'sample.sjs', (err, result)->
      expect(err).not.to.be.ok
      expect(result.data).to.equal(validResult)
      done()

describe 'Sourcemap', ->
  plugin = null
  beforeEach ->
    plugin = new Plugin
      plugins:
        sweet:
          sourceMap: yes

  it 'should be able to set source map options', -> expect(plugin.options.sourceMap).to.be.ok
  it 'should be able to output source maps', (done)->
    src = readFile 'fixtures/sample.sjs'
    validResult = readFile 'fixtures/sample.js'

    plugin.compile src, 'sample.sjs', (err, result)->
      expect(result.map).to.be.a('string')
      done()

describe 'Module', ->
  plugin = null
  beforeEach ->
    plugin = new Plugin
      plugins:
        sweet:
          modules: ['./test/fixtures/macro.sjs']

  it 'should be able to set module options', -> expect(plugin.options.modules).to.be.instanceof(Array)
  it 'should compile valid result with module options', (done)->
    src = readFile 'fixtures/module.sjs'
    validResult = readFile 'fixtures/sample.js'

    plugin.compile src, 'module.sjs', (err, result)->
      expect(result.data).to.equal(validResult)
      done()

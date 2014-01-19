{expect} = require 'chai'
Plugin = require '../'

describe 'Plugin', ->
  beforeEach -> plugin = new Plugin({})

  it 'should be an object', -> expect(plugin).to.be.ok

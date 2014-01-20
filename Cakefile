{spawn, exec} = require 'child_process'

spawnRunner = (cmd, args, cb)->
  subproc = spawn cmd, args
  subproc.stderr.on 'data', (data)-> process.stderr.write data.toString()
  subproc.stdout.on 'data', (data)-> process.stdout.write data.toString()
  subproc.on 'exit', (code)->
    if cb?
      cb()
    else
      process.exit code

build = (cb)-> spawnRunner './node_modules/coffee-script/bin/coffee', ['-o', '.', '-bc', 'src/index.coffee'], cb
test = -> build -> spawnRunner('./node_modules/mocha/bin/mocha', ['test/index.coffee'])

task 'build', 'build javascript file', -> build()

task 'test', 'test plugin', -> test()

task 'coveralls', 'cover all !!', -> exec './node_modules/mocha/bin/mocha --reporter mocha-lcov-reporter test/index.coffee | ./node_modules/coveralls/bin/coveralls.js'

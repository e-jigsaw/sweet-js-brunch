{spawn} = require 'child_process'

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
coveralls = -> spawnRunner './node_modules/coffee-script/bin/mocha', ['-R', 'mocha-lcov-reporter', '|', 'coveralls']

task 'build', 'build javascript file', -> build()

task 'test', 'test plugin', -> test()

task 'coveralls', 'cover all !!', -> coveralls()

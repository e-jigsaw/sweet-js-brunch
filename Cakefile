{spawn} = require 'child_process'

task 'build', 'build javascript file', ->
  spawn './node_modules/coffee-script/bin/coffee', ['-o', '.', '-bc', 'src/index.coffee'],
    stdio: 'inherit'

task 'test', 'test plugin', ->
  invoke 'build'
  spawn './node_modules/mocha/bin/mocha', ['--compilers', 'coffee:coffee-script', 'test/index.coffee'],
    stdio: 'inherit'

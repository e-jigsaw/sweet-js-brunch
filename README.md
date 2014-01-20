[![Build Status](https://travis-ci.org/e-jigsaw/sweet-js-brunch.png?branch=master)](https://travis-ci.org/e-jigsaw/sweet-js-brunch)
[![NPM version](https://badge.fury.io/js/sweet-js-brunch.png)](http://badge.fury.io/js/sweet-js-brunch)
[![Dependency Status](https://david-dm.org/e-jigsaw/sweet-js-brunch.png)](https://david-dm.org/e-jigsaw/sweet-js-brunch)
[![devDependency Status](https://david-dm.org/e-jigsaw/sweet-js-brunch/dev-status.png)](https://david-dm.org/e-jigsaw/sweet-js-brunch#info=devDependencies)

sweet-js-brunch
===============

Adds [Sweet.js](https://github.com/mozilla/sweet.js) support to [brunch](http://brunch.io).

## Installation

Install the plugin via npm with `npm install --save sweet-js-brunch`.

* Add `"sweet-js-brunch": "x.y.z"` to `package.json` of your brunch app.
  Pick a plugin version that corresponds to your minor (y) brunch version.
* If you want to use git version of plugin, add
`"sweet-js-brunch": "git+ssh://git@github.com:e-jigsaw/sweet-js-brunch.git"`.

## Configuration

You can set the `sourceMap` option in your brunch config file.

```coffee
exports.config =
  plugins:
    sweet:
      sourceMap: yes
```

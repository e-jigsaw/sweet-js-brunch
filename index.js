// Generated by CoffeeScript 1.6.3
var SweetJSCompiler, sjs;

sjs = require('sweet.js');

SweetJSCompiler = (function() {
  SweetJSCompiler.prototype.brunchPlugin = true;

  SweetJSCompiler.prototype.type = 'javascript';

  SweetJSCompiler.prototype.extension = 'js';

  function SweetJSCompiler(cfg) {
    var _ref, _ref1;
    this.options = (_ref = (_ref1 = cfg.plugins) != null ? _ref1.sweet : void 0) != null ? _ref : {};
    if (this.options.modules != null) {
      this.options.modules = this.options.modules.map(function(file) {
        return sjs.loadNodeModule(__dirname, file);
      });
    }
    null;
  }

  SweetJSCompiler.prototype.compile = function(data, path, callback) {
    var err, result, sweetResult;
    try {
      if (this.options.sourceMap != null) {
        this.options.filename = path;
      }
      sweetResult = sjs.compile(data, this.options);
    } catch (_error) {
      err = _error;
      callback(err);
    }
    result = {
      data: sweetResult.code,
      map: sweetResult.sourceMap
    };
    return callback(null, result);
  };

  return SweetJSCompiler;

})();

module.exports = SweetJSCompiler;

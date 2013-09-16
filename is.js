(function() {
  var extend, iz, izfn, umd;

  umd = function(factory) {
    if (typeof exports === 'object') {
      return module.exports = factory;
    } else if (typeof define === 'function' && define.amd) {
      return define([], factory);
    } else {
      return this.is = factory;
    }
  };

  iz = {
    array: function(thing) {
      return !iz.string(thing) && !iz.number(thing) && iz.object(thing) && iz.defined(thing.length);
    },
    boolean: function(thing) {
      return typeof thing === 'boolean';
    },
    defined: function(thing) {
      return thing !== void 0;
    },
    "function": function(thing) {
      return typeof thing === 'function';
    },
    "null": function(thing) {
      return thing === null;
    },
    number: function(thing) {
      return typeof thing === 'number';
    },
    object: function(thing) {
      return typeof thing === 'object';
    },
    string: function(thing) {
      return typeof thing === 'string';
    }
  };

  izfn = function(thing, type) {
    if (iz.defined(iz[type])) {
      return iz[type](thing);
    } else {
      return void 0;
    }
  };

  extend(izfn, iz);

  umd(izfn);

  extend = function(a, b) {
    var key;
    for (key in b) {
      a[key] = b[key];
    }
    return a;
  };

}).call(this);

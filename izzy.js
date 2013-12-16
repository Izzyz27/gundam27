(function(root, factory) {
    if(typeof exports === 'object') {
        module.exports = factory();
    }
    else if(typeof define === 'function' && define.amd) {
        define('izzy', [], factory);
    }
    else {
        root.izzy = factory();
    }
}(this, function() {
var extend, izzy, toString, types;

extend = function(a, b) {
  var key;
  for (key in b) {
    a[key] = b[key];
  }
  return a;
};

toString = function(thing) {
  return {}.toString.call(thing);
};

types = {
  array: function(thing) {
    return (toString(thing)) === '[object Array]';
  },
  boolean: function(thing) {
    return (toString(thing)) === '[object Boolean]';
  },
  undefined: function(thing) {
    return (toString(thing)) === '[object Undefined]';
  },
  element: function(thing) {
    return ((toString(thing)).indexOf('HTML')) > -1;
  },
  "function": function(thing) {
    return (toString(thing)) === '[object Function]';
  },
  nan: function(thing) {
    return thing !== thing;
  },
  "null": function(thing) {
    return (toString(thing)) === '[object Null]';
  },
  number: function(thing) {
    return (toString(thing)) === '[object Number]' && !izzy.nan(thing);
  },
  object: function(thing) {
    return (toString(thing)) === '[object Object]';
  },
  string: function(thing) {
    return (toString(thing)) === '[object String]';
  }
};

izzy = function(type, thing) {
  if (!types.undefined(types[type])) {
    return types[type](thing);
  } else {
    return void 0;
  }
};

extend(izzy, types);

    return izzy;
}));

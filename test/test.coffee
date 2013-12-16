
_ = require 'lodash'
izzy = require '../izzy'

console.log 'zyy', izzy

subjects =
	array: [[], new Array()]
	boolean: [true, false]
	defined: [undefined]
	function: [(->), new Function()]
	nan: [NaN]
	null: [null]
	number: [42, new Number(42)]
	object: [{}, new Object()]
	string: ['bar', new String('bar')]

_.each subjects, (cases, type) ->

	exports[type] = (test) ->

		_.each cases, (thing) ->
			test.strictEqual izzy[type](thing), true
			test.strictEqual izzy(type, thing), true

		do test.done
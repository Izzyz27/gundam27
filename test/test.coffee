
_ = require 'lodash'
izzy = require '../izzy'

subjects =
	array: [[], new Array()]
	boolean: [true, false]
	function: [(->), new Function()]
	nan: [NaN]
	null: [null]
	number: [42, new Number(42)]
	object: [{}, new Object()]
	string: ['bar', new String('bar')]
	undefined: [undefined]

_.each subjects, (cases, type) ->

	exports[type] = (test) ->

		_.each cases, (thing) ->

			# test for proper type detection
			test.strictEqual izzy[type](thing), true
			test.strictEqual izzy(type, thing), true

			# test for false positives
			_.each (_.omit subjects, type), (_cases, _type) ->
				_.each _cases, (_thing) ->

					test.strictEqual izzy[type](_thing), false
					test.strictEqual izzy(type, _thing), false



		do test.done
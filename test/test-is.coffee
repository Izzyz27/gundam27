

iz = require '../is'

subjects =
	array: [],
	boolean: false
	defined: NaN
	function: ->
	null: null
	number: 42
	object: {}
	string: 'bar'

for type, subject of subjects

	exports[type] = (test) ->

		for innertype, innersubject of subjects
			test.strictEqual iz[type](innersubject), type is innertype

		test.done()
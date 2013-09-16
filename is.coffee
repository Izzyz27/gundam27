
# UMD (play nice with AMD, CommonJS, globals)
umd = (factory) ->
	if typeof exports is 'object'
		module.exports = factory
	else if typeof define is 'function' and define.amd
		define([], factory)
	else
		@is = factory

# type check functions
iz =

	array: (thing) ->

		not iz.string(thing) and not iz.number(thing) and iz.object(thing) and iz.defined(thing.length)

	boolean: (thing) ->

		typeof thing is 'boolean'

	defined: (thing) ->

		thing isnt undefined

	function: (thing) ->

		typeof thing is 'function'

	null: (thing) ->

		thing is null

	number: (thing) ->

		typeof thing is 'number'

	object: (thing) ->

		typeof thing is 'object'

	string: (thing) ->

		typeof thing is 'string'

# accept both dot and argument notation
izfn = (thing, type) ->

	if iz.defined iz[type]
		iz[type] thing
	else
		undefined
		
extend izfn, iz

# export!
umd izfn

# helpers

extend = (a, b) ->

	for key of b
		a[key] = b[key]

	a
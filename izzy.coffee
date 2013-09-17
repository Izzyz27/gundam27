
# UMD (play nice with AMD, CommonJS, globals)
umd = (factory) ->
	if typeof exports is 'object'
		module.exports = factory
	else if typeof define is 'function' and define.amd
		define([], factory)
	else
		@izzy = factory

# helper
extend = (a, b) ->
	for key of b
		a[key] = b[key]
	a

# type check functions
izzy =

	array: (thing) ->

		not izzy.string(thing) and not izzy.number(thing) and izzy.object(thing) and izzy.defined(thing.length)

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
izzyFn = (type, thing) ->

	if izzy.defined izzy[type]
		izzy[type] thing
	else
		undefined

extend izzyFn, izzy

# export!
umd izzyFn
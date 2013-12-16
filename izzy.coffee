# helpers
extend = (a, b) ->
	for key of b
		a[key] = b[key]
	a

toString = (thing) ->
	({}).toString.call thing

# type check functions
types =

	array: (thing) ->

		(toString thing) is '[object Array]'

	boolean: (thing) ->

		(toString thing) is '[object Boolean]'

	defined: (thing) ->

		(toString thing) isnt '[object Undefined]'

	element: (thing) ->

		((toString thing).indexOf 'HTML') > -1

	function: (thing) ->

		(toString thing) is '[object Function]'

	nan: (thing) ->

		thing isnt thing

	null: (thing) ->

		(toString thing) is '[object Null]'

	number: (thing) ->

		(toString thing) is '[object Number]' and not izzy.nan thing

	object: (thing) ->

		(toString thing) is '[object Object]'

	string: (thing) ->

		(toString thing) is '[object String]'

# accept both dot and argument notation
izzy = (type, thing) ->

	if types.defined types[type]
		types[type] thing
	else
		undefined

extend izzy, types
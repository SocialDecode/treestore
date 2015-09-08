class treestore
	tree : {}
	push:(el, debug=false)->
		es = []
		es.push letter for letter in el.toString()
		@tree = @merge(@tree,es,debug)
		return JSON.stringify @tree,null,3 if debug
	merge:(o,s,d)->
		console.log o,s if d
		if s.length > 1
			l = s.shift()
			console.log ":", l, o[l] if d
			if o[l]?
				if o[l] is true
					l2 = s.shift()
					o[l] = {eow:true}
					o[l][l2] = @merge({},s,d)
				else
					o[l] = @merge(o[l],s,d)
			else
				o[l] = @merge({},s,d)
			return o
		else
			return true
	size:->
		return {
			unpacked:Buffer.byteLength(JSON.stringify(@tree),'utf8'),
			packed:Buffer.byteLength(@pack().toString('hex'),'utf8')
		}
	pack:->
		msgpack = require('msgpack5')()
		msgpack.encode(@tree)

	#compare:(otree)->
		#plain_a = {}
		#plain_b = {}
		#matches = 0
		#dig_in = (obj,destino)->
			#for a of otree.tree
				#if typeof(a) is "object"
		#dig_in(otree.tree,_plain_b)
		#console.log plain_a

module.exports = treestore

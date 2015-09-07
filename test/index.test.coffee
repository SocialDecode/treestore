Treestore = new require "../index.coffee"

exports.testInsert = 
	setUp : (callback)->
		@treestore = new Treestore
		callback()
	'insertion of elements': (test)->
		#console.log @treestore.push "casa"
		#console.log @treestore.push "perro"
		#console.log @treestore.push "perreo"
		#console.log @treestore.push "perron"
		#console.log @treestore.push "perronsisisisimo"
		testobj = {}
		for x in [0..30000]
			k = "twitter_#{x}"
			@treestore.push k 
			testobj[k]=true
		console.log @treestore.size() + " bytes."
		console.log Buffer.byteLength(JSON.stringify(testobj),'utf8') + " bytes."
		test.done()
	#'element comparisson': (test)->
		#@treestore2 = new Treestore
		#for x in [20000..30000]
			#@treestore2.push "twitter_#{x}"
		#console.log @treestore.compare(@treestore)
		#test.done()

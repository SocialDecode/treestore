Treestore = new require "../index.coffee"

exports.testInsert = 
	setUp : (callback)->
		@treestore = new Treestore
		callback()
	'insertion of elements': (test)->
		for x in [1..30]
			@treestore.push "twitter_#{x}"
		for x in [1..9]
			test.ok @treestore.tree["t"]["w"]["i"]["t"]["t"]["e"]["r"]["_"][x.toString()]?
		test.done()
	'unique count': (test)->
		test.equal(@treestore.length(), 30) # number of unique elements
		test.done()
	'element comparison': (test)->
		@treestore2 = new Treestore
		for x in [20..39]
			@treestore2.push "twitter_#{x}"
		test.equal(@treestore.compare(@treestore), 50) # this is the number of coincidences
		test.done()
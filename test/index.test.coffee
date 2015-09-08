Treestore = new require "../index.coffee"

exports.testInsert = 
	setUp : (callback)->
		@treestore = new Treestore
		callback()
	'insertion of elements': (test)->
		for x in [1..30]
			@treestore.push "twitter_#{x}", if (x is 4) then true else false
		for x in [1..9]
			test.ok @treestore.tree["t"]["w"]["i"]["t"]["t"]["e"]["r"]["_"][x.toString()]?
		console.log JSON.stringify @treestore.tree , false, 3
		test.done()
	'element comparisson': (test)->
		@treestore2 = new Treestore
		for x in [20..39]
			@treestore2.push "twitter_#{x}"
		result = @treestore.compare(@treestore)
		test.equal(result.ratio, 0.22) # this is the ratio of coincidences of sample a + sample b (50); 1/50 * 100
		test.done()
	'unique count': (test)->
		test.equal(@treestore.length(), 30) # number of unique elements
		test.done()
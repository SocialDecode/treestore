# TreeStore
Unique data saving and comparison for faster comparison.

The object of this module is to generate a string representation (currently works as a JSON.stringify of an object)
for a subset of unique data with the objective of make comparison of large datasets faster, smaller to store and simpler
to incrementally increase the unique universe of data (currently string elements).

## Quick Example
```coffeescript
Treestore = require "treestore"
treestore = new Treestore
treestore.push "casa"
treestore.push "perreo"
treestore.push "perron"
treestore.push "perro"
```


## Architecture

```
{
	"c":{
		"a"{
			"s":{
				"a":true
			}
		}
	},
	"p":{
		"e":{
			"r":{
				"r":{
					"e":{
						"o":true
					},
					"o":{
						"n":true,
						"eow":true
					}
				}
			}
		}
	}
}
```

## Methods 

### push(string)

Adds a new element to the tree, if already contained the tree will not be changed.

### size()

Returns the size in bytes of the unpacked and packed (using msgpack) string representation.

```{ unpacked: 343, packed: 260 }```

## length()

Returns the number of elements of the tree.

## compare(another_treestore)*

Returns the number of matches between two treestores

*toDo

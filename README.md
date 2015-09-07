# TreeStore
Unique data saving and comparison for faster comparison.

The object of this module is to generate a string representation (currently works as a JSON.stringify of an object)
for a subset of unique data with the objective of make comparison of large datasets faster, smaller to store and simpler
to incrementally increase the unique universe of data (currently string elements).

Usage :
```javascript
Treestore = require("treestore")
treestore = new Treestore
treestore.push "casa"
treestore.push "perreo"
treestore.push "perron"
```

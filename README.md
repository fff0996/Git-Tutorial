# mapping
It is a directory where codes for functions related to mapping that switch 
from A to B are stored.

mapping.R
==================================
This mapping table is mapped by R  
database is gotten by **biomart**

target -> gene_ID(Entrez,Homosapience)

input file: target.txt (uniport,Esembl,..)
```````
target1
target2
target3
```````
output file: mapping.txt
````````````````````
target1\tgene_ID1
target2\tgene_ID2
target3\tgene_ID3
...
`````````````````````
cut.pl
==================================
we want to delete elements that don't have Targets

input file : element_targets.txt
```````
element1\ttarget1\ttarget2\ttarget3...
element2\ttarget3\ttarget5..
element3
element4\ttarget2\ttarget9\ttarget8....
```````

output file: delete elements that don't have Targets
````````
element1\ttarget1\ttarget2\ttarget3...
element2\ttarget3\ttarget5..
element4\ttarget2\ttarget9\ttarget8....
```````

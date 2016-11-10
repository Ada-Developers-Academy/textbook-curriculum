# Trees

## Presentation
+ [Trees](https://docs.google.com/presentation/d/1UMlgBfobtBKtwhirtFU76XKk9e_oSr9CaUAukN_lvC8/edit#slide=id.g659367895_0_57)

## Assignment
+ [AdaGold/tree-practice](https://github.com/AdaGold/tree-practice)

## Notes

### Tree Vocabulary

-  Nodes
	-  a `node` is where one value in a tree is stored. Each node contains a value and references to its child nodes.
-  Root
	- The `root` of a tree is the topmost `node`, or the `node` in the tree with no parents.  
-  Parent
	- The `parent` of a node is the one which references the given node directly.
-  Siblings
	-  a node's `siblings` are nodes which share the same direct parent.  
-  Descendant
	- a `descendant` of a node is a node which can be reached directly or indirectly from the given node.  
-  Ancestor
	- An ancestor of a node is a node which refers directly or indirectly to the given node.  The `root` node is the `ancestor` for all nodes in the tree.  
-  Leaf
	- A `leaf node` is a node with no descendants.  
-  Edge
	- An `edge` of a tree is a connection between nodes. 
-  Path
	- A `path` in a tree is a series of nodes that can be traversed from one node to another.  
-  Level
	- The `level` of a node is 1 + the number of nodes between the given node and the root.
-  Height 
	-  The `height` of a node is the longest path between that node and one of it's leaf descendants.  
-  Depth
	- The `depth` of a node is the number of edges from the root to the node. 
-  Traversal
	- `Traversing` through a tree is navigating through a tree executing some action on each node exactly once.  



### Tree vs Linked List

Binary Search Trees have a few differences compared to linked lists.

Superficially
-  Each node can link to up to two other nodes
-  There is no single end to a tree, rather many `leaves`.  

Performance:
-  It's potentially much faster to find elements in a Binary Search Tree.  
-  Each Node is slightly bigger in terms of memory footprint and there is some overhead involved in keeping the tree `balanced`.  



### Traversing a Tree

There are three common ways to iterate through a tree called a `traversal`, in-order traversal, pre-order traversal and post-order traversal.  
-  Inorder Traversal is usually only applied to binary search trees.  In an `inorder traversal` we traverse the left child first then the parent and then traverse the right child.  	
-  A `preorder traversal` we visit the current node first and then traverse the left subtree and then traverse the right subtree.
-  A `post-order` traversal involves traversing the right and left subtrees and then visiting the current node.  

### Special Trees

-  Binary Tree
	- A `binary tree` is a tree in which each node has at most 2 children (bi implies 2).
- Full Binary Tree
	- A `full binary tree` is a binary tree where every node except the leaves has two children.  
- Complete tree
	- A `full tree` is a binary tree where every level at every level except the bottom-most level has the maximum number of children (2).  
-  Binary Search Tree
	- A `Binary Search Tree` is a binary tree where the left child of a node is always smaller than it's parent and every right-child of a node is larger than it's parent.  
-  Subtree
	- A subtree is the tree formed by the left or right children of a given node.  



## Resources
[A Good Stack-Overflow Post comparing Trees & Linked Lists](http://stackoverflow.com/a/270094/6840529)

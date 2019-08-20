# Trees

## Learning Goals

Get familiar with Binary Search Trees and the following algorithms related to it

- Search
- Insert value
- Delete value
- Find height
- Depth first traversals: pre-order, in-order, post-order
- Breadth first traversal

We'll be covering BSTs in two parts. In the first session, we'll cover the recursive approach. In a later session, we'll cover the iterative approach.

## Limitations of Linked Lists

Remember that finding an element in a Linked List requires a runtime of O(n).  This is because any search in a Linked List requires a linear search.  However once a Linked List node is found, removing or adding a node is O(1).  It would be ideal to combine binary search O(log<sub>n</sub>) with the O(1) runtime to remove or add nodes.  This is what Binary Search Trees give us.

## Binary Search Tree Node

Just like a Linked List node, a tree node has a data field, and links to other nodes.  However instead of linking to previous and next nodes, the links are to nodes less than and greater than the value in the data field.

```ruby
class TreeNode
  attr_reader :data
  attr_accessor :left, :right

  def initialize(data)
    @data = data
    @left = @right = nil
  end
end
```

These nodes are arrange with one node known as the **root** which is where the tree begins.  New nodes as they are added are placed to the left, if they are less than the current node, and to the right if they are greater than the current node.  This is a natually recursive process.

```
Method add:
  if the root is nil set the root to be a new node with the given value.

  Otherwise if the value is less than the root, call add on the l

```

## Exercises

Design a recursive algorithm, deduce the space and time complexity and then, author functions to do the following. For each of the problems below, assume you are given a Binary Search Tree where each node contains an integer data and links to the left and right children nodes.

  1. Search for a given integer value in the Binary Search Tree. Return true if the value is found, false otherwise.
  2. Insert a given integer value in the Binary Search Tree.
  3. Compute the height of the Binary Search Tree.
  4. Print values in the Binary Search Tree in pre-order.
  5. Print values in the Binary Search Tree in in-order.
  6. Print values in the Binary Search Tree in post-order.
  7. Print values in the Binary Search Tree in level-order. (Breadth-first traversal)
  8. Delete a given value from the Binary Search Tree.

Design an iterative algorithm for the first seven exercises above, deduce the space and time complexity and author the functions to implement them. You may use additional data structures.

## Additional Resources

- Recursion
  - Khan Academy on [Recursion](https://www.khanacademy.org/computing/computer-science/algorithms#recursive-algorithms)
  - Cornell CS211 Lecture Notes on [Recursion] (http://www.cs.cornell.edu/info/courses/spring-98/cs211/lecturenotes/07-recursion.pdf)
- Trees
  - [Trees](https://drive.google.com/drive/u/0/folders/0B6DpS0ihYV31alhKR2NKc3BuUGc)
  - Kal academy's material on [BSTs](https://drive.google.com/open?id=0BxHords9odw3ZXRGUlBZTHEta2M)
  - Kal academy's material on [Balanced BST](https://drive.google.com/open?id=0BxHords9odw3Sk5VZE9heWJjUXM)
  - Kal academy's material on [Bit Arrays](https://drive.google.com/open?id=0BxHords9odw3ZU11dzBtWkxCMjQ)
  - Read about [Tree Traversals](http://www.geeksforgeeks.org/618/) and watch videos on GeeksForGeeks
  - Read about [Binary Tree Introduction](http://quiz.geeksforgeeks.org/binary-tree-set-1-introduction/) on GeeksForGeeks
  - Read about [Binary Tree Properties](http://quiz.geeksforgeeks.org/binary-tree-set-2-properties/) on GeeksForGeeks
  - Read about [Types of Binary Tree](http://quiz.geeksforgeeks.org/binary-tree-set-3-types-of-binary-tree/) on GeeksForGeeks
  - Stanford CS Education Library material on [Binary Trees](http://cslibrary.stanford.edu/110/)
  - Stanford CS Education Library material on [Tree List Recursion Problem](http://cslibrary.stanford.edu/109/)
  - Cornell CS211 Lecture Notes on [Lists, Priority Queues and Binary Search Trees](http://www.cs.cornell.edu/info/courses/spring-98/cs211/lecturenotes/06-ListsPQsBSTs.pdf)
  - MIT Open Courseware on [Breadth First Search](https://ocw.mit.edu/courses/electrical-engineering-and-computer-science/6-006-introduction-to-algorithms-fall-2011/lecture-videos/lecture-13-breadth-first-search-bfs/)
  - MIT Open Courseware on [Depth First Search](https://ocw.mit.edu/courses/electrical-engineering-and-computer-science/6-006-introduction-to-algorithms-fall-2011/lecture-videos/lecture-14-depth-first-search-dfs-topological-sort/)
  - MIT Open Courseware on [Binary Search Trees, BST Sort](https://ocw.mit.edu/courses/electrical-engineering-and-computer-science/6-006-introduction-to-algorithms-fall-2011/lecture-videos/lecture-5-binary-search-trees-bst-sort/)

## Optional offline Problem Sets

- Convert a given integer array e.g. {5,2,1,6,7,3,4} to a Binary Search Tree.
- Find the height of a BST using an iterative solution.
- Given 2 Binary Trees (not BST), return true if both trees have the same in-order else return false. Note: You can save in-order from both trees and compare in the end (try implementing this as well). Can you inorder traverse them parallely and stop the traversal on a mismatch to return false instead?
- In "Cracking the Coding Interview" book, "Chapter 4: Trees and Graphs"
- CareerCup [Trees and Graph Interview Questions](https://www.careercup.com/page?pid=trees-and-graphs-interview-questions) - scan and look for the tree interview questions.
- Kal academy's problems on [Trees](https://drive.google.com/open?id=0BxHords9odw3b2d1ZTJtVkZZTkk)

## Slide Deck

- Former Slide Deck used in class</br>
<span xmlns:dct="http://purl.org/dc/terms/" property="dct:title"><a href="https://drive.google.com/file/d/0B__DV26QHsH4SXFxN2JpS3RGRkE/view?usp=sharing">Binary Search Trees</a> and <a href="https://drive.google.com/file/d/0B__DV26QHsH4bWJmS1A0QXBad1U/view?usp=sharing">Introduction to Recursion</a></span> is licensed under a <a rel="license" href="http://creativecommons.org/licenses/by-nc-nd/4.0/">Creative Commons Attribution-NonCommercial-NoDerivatives 4.0 International License</a>.</br>
<a rel="license" href="http://creativecommons.org/licenses/by-nc-nd/4.0/"><img alt="Creative Commons License" style="border-width:0" src="https://i.creativecommons.org/l/by-nc-nd/4.0/88x31.png" /></a>

# Trees
## Goal
Binary Seach Tree
+ Search
+ Insert value
+ Delete value
+ Fing height
+ Depth first traversals - recursive and iterative
+ Breadth first traversal


## Offline Reading Material
Go through what you've already learned:
+ Revise classroom session on [Introduction to Recursion](https://github.com/Ada-Developers-Academy/textbook-curriculum/blob/master/04-cs-fundamentals/classroom/04-Intro-to-Recursion.md)
+ Revise classroom session on [Trees](https://github.com/Ada-Developers-Academy/textbook-curriculum/blob/master/04-cs-fundamentals/classroom/08-Trees.md)
+ Read the detailed notes on [Trees](https://drive.google.com/drive/u/0/folders/0B6DpS0ihYV31alhKR2NKc3BuUGc)
+ Read classroom session on [Stacks and Queues](https://github.com/Ada-Developers-Academy/textbook-curriculum/blob/master/04-cs-fundamentals/classroom/02-ADTs-Stacks-Queues.md)

Find the reading material that helps you learn from the below links:
+ Kal academy's material on [BSTs](https://drive.google.com/open?id=0BxHords9odw3ZXRGUlBZTHEta2M)
+ Kal academy's material on [Balanced BST](https://drive.google.com/open?id=0BxHords9odw3Sk5VZE9heWJjUXM)
+ Kal academy's material on [Bit Arrays](https://drive.google.com/open?id=0BxHords9odw3ZU11dzBtWkxCMjQ)
+ Read about [Tree Traversals](http://www.geeksforgeeks.org/618/) and watch videos on GeeksForGeeks
+ Read about [Binary Tree Introduction](http://quiz.geeksforgeeks.org/binary-tree-set-1-introduction/) on GeeksForGeeks
+ Read about [Binary Tree Properties](http://quiz.geeksforgeeks.org/binary-tree-set-2-properties/) on GeeksForGeeks
+ Read about [Types of Binary Tree](http://quiz.geeksforgeeks.org/binary-tree-set-3-types-of-binary-tree/) on GeeksForGeeks
+ Stanford CS Education Library material on [Binary Trees](http://cslibrary.stanford.edu/110/)
+ Stanford CS Education Library material on [Tree List Recursion Problem](http://cslibrary.stanford.edu/109/)
+ Cornell CS211 Lecture Notes on [Recursion] (http://www.cs.cornell.edu/info/courses/spring-98/cs211/lecturenotes/07-recursion.pdf)
+ Cornell CS211 Lecture Notes on [Lists, Priority Queues and Binary Search Trees](http://www.cs.cornell.edu/info/courses/spring-98/cs211/lecturenotes/06-ListsPQsBSTs.pdf)
+ MIT Open Courseware on [Breadth First Search](https://ocw.mit.edu/courses/electrical-engineering-and-computer-science/6-006-introduction-to-algorithms-fall-2011/lecture-videos/lecture-13-breadth-first-search-bfs/)
+ MIT Open Courseware on [Depth First Search](https://ocw.mit.edu/courses/electrical-engineering-and-computer-science/6-006-introduction-to-algorithms-fall-2011/lecture-videos/lecture-14-depth-first-search-dfs-topological-sort/)
+ MIT Open Courseware on [Binary Search Trees, BST Sort](https://ocw.mit.edu/courses/electrical-engineering-and-computer-science/6-006-introduction-to-algorithms-fall-2011/lecture-videos/lecture-5-binary-search-trees-bst-sort/)
+ Wikipedia information on [Binary Tree](https://en.wikipedia.org/wiki/Binary_tree)

## Offline Problem Sets
+ In "Cracking the Coding Interview" book, "Chapter 4: Trees and Graphs"
+ CareerCup [Trees and Graph Interview Questions](https://www.careercup.com/page?pid=trees-and-graphs-interview-questions) - scan and look for the tree interview questions.
+ Kal academy's problems on [Trees](https://drive.google.com/open?id=0BxHords9odw3b2d1ZTJtVkZZTkk)
+ Print all values in a Binary Search Tree using Post-order traversal using an iterative solution. Assume you are provided a Stack data structure that can contain the tree Node pointer or reference.
+ Print all values in a BST in breadth first traversal order
+ Convert a given integer array e.g. {5,2,1,6,7,3,4} to a Binary Search Tree. Challenge: Ensure that the tree is balanced.
+ Find the height of a BST using an iterative solution.
+ Given 2 Binary Trees (not BST), return true if both trees have the same in-order else return false. Note: You can save in-order from both trees and compare in the end (try implementing this as well). Can you inorder traverse them parallely and stop the traversal on a mismatch to return false instead?

## In Class
Time permitting, here's the problems we'll cover in class.
Design and implement pseudo code for:
+ 1. Delete a given value from a Binary Search Tree using recursive solution.
+ 2. Print all values in a Binary Tree using Pre-order and In-order traversals. Implement each solution iteratively. Assume you are provided a Stack data structure for 'struct Node*'
+ 3. Print all values in a Binary Tree using Pre-order, Post-order and In-order traversals. Implement each solution recursively.
+ 4. Find the height of Binary Tree. Implement the recursive solution.
+ 5. Insert a given value in a Binary Search Tree. Implement both iterative and recursive solutions.
+ 6. Find a given value in a Binary Search Tree. Implement both iterative and recursive solutions. </br>

<b>Note</b>: Assume each Node in the tree to look like: </br>
struct Node { </br>
  &nbsp; int data; </br>
  &nbsp; struct Node *left; </br>
  &nbsp; struct Node *right; </br>
}; </br>

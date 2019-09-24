# Graphs

## Learning Goals

By the end of this lesson you should be able to:

- Explain a graph data structure
- Explain how an ordered or unordered set of verticies can represent a graph
- Write algorithms using graphs
- Explain dijkstra algorithm

## Video Lesson

- [Video Lesson]()
- [Accompanying Slidedeck]()
- [Exercise]()

## Introduction

Graphs are a data structure in computer science represented by a set of nodes connected by what are called edges.  Naturally graphs can be used to solve problems like finding the cheapest way to visit all the cities below.

![Graphs Demo 1](images/graphs1.png)

They can also be used to solve problems like this.  Fairaday Academy is planning to host exams.  They have a number of classes and a number of students.  However they want to schedule exams in such a manner that no student is scheduled to take two exams a the same time.  There are `m` exam slots.

![Student Exam Graph Example](images/graphs2.png)

In the example above, each course is represented by nodes, and students which take both courses represent an edge between two nodes.  To solve the problem you would look for a way to assign courses to slots which are not directly connected by an edge.  Many many problems can be represented by graphs even those not involving geographic or navigational problems.  Studying graph problems gives us another way to solve a broad sector of difficult problems.

## Graph Description

A graph is a data structure in computer science, consisting of a finite collection of _nodes_, also called _verticies_, and a collection of connections between nodes known as _edges_.  A graph can be either a _directed graph_, or an _undirected graph_.  In a directed graph, edges are not bidirectional.  So in the example below you travel from node A to node B, but not from node B to node A.

**Directed Graph**
![Example Directed Graph](images/directed-graph.png)

On the other hand, in an undirected graph, each edge is bidirectional.  In other words in the example graph below you can travel from Ada to Babbage and from Babbage to Ada.

**Undirected Graph**
![Example Undirected Graph](images/undirected-graph.png)

Graphs can also be either _weighted graphs_ or _unweighted graphs_.  In a weighted graph, each edge is assigned a numeric cost or weight.  A weighted graph can either be directed or undirected.  

**Weighted & Undirected Graph**
![Example Weighted Graph](images/weighted-graph.png)

As you may have noted, we have **already** worked with graphs before.  Both Linked Lists & Binary Search Trees are specific types of graphs.  In this lesson we will explore more generic graph algorithms and look at a few classic problems.

## How To Represent A Graph

### List of Edges

### Adjacentcy Matrix

### Adjacency List

### Adjacency List With A Hash

## Graph Algorithms

### Breadth-First-Search

### Depth First Search

### Shortest Path Algorithms

**Dijkstra's Algorithm**

## Summary

## Terms & Definitions

| Term | Definition |
|--- |--- |
| Graph | A data structure with two parts:  A limited set of verticies, called nodes, and a limited set of connections between nodes known as edges. |
| Edge | A connection between two nodes in a graph |
| Node | The fundamental unit of a graph in computer science.  Each element of a graph, connected by edges. |
| Sparse Graph | A graph with few edges when compared to nodes. |
| Dense Graph | A graph with many more edges when compared to nodes.  A graph is considered _dense_ when it has close to the maximum number of possible edges. |
| Directed Graph |  A graph where the edges connet in one direction.  For example an edge may conect nodes A -> B, but will not connect B -> A. |
| Undirected Graph | A Graph in which each edge is bidirectional.  So an edge from A -> B also connects B -> A |
| Adjacency Matrix | A 2-dimensional array listing the connections between nodes in a graph |
| Adjacency List | A collection of unordered lists used to represent a graph.  Each list describes the neighors of a particular node.
| Node Degree | The number of edges a particular node has |

## Resources

- [BaseCS on Graphs](https://medium.com/basecs/from-theory-to-practice-representing-graphs-cfd782c5be38)
- [Dijkstra's Algorithm]()
- [Geeks for Geeks: Graphs and it's representations](https://www.geeksforgeeks.org/graph-and-its-representations/)
- [Coursera:  Algorithms on Graphs](https://www.coursera.org/lecture/algorithms-on-graphs/representing-graphs-c4W9f)
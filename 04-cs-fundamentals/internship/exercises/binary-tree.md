# Binary Tree Exercises

## Instructions

In pairs answer the following questions as if they are whiteboarding exercises.  Write down your answers for each step.

For Each Question:

- **Step 1:**  Write down 2 - 3 clarifying questions you would ask an interviewer.
- **Step 2:**  Write down assumptions for each of those questions.
- **Step 3:**  Generate 3+ sample input & output combinations to the methods described.  Look for edge-cases
- **Step 4:**  Write a proposed solution.
- **Step 5:**  Test your solution with your sample input.
- **Step 6:**  Evaluate your solution in terms of space & time complexity.

## Sample Code

```ruby
class Student
  attr_reader :id, :name

  def initialize(id, name)
    @id = id
    @name = name
  end
end

class TreeNode
  attr_reader :key, :value
  attr_accessor :left, :right

  def initialize(k, v, l = nil, r = nil)
    @key = k
    @value = v
    @left = l
    @right = r
  end
end
```

## Questions

1. Create a method which takes in an array of sorted students and generates a balanced Binary Search Tree.

2. Write a method which takes a `TreeNode`, called `current_node` as an argument and returns true if the tree with it's root at `current_node` is the root of a valid binary search tree and false if it is not.

For example given node `m`:

```txt
        m
      /   \
    a       z
```

The method would return true.

Given node `h`:

```txt
        h
      /   \
    m       v
```

The method would return `false`.

3. Create a method which takes 3 `TreeNode` objects as arguments, `root`, `node_1`, and `node_2` and returns the first common ancestor of `node_1` and `node_2`.

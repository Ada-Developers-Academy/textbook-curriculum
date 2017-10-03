# Sorting
## Learning Goals
- Understand common sorting algorithms and their efficiency
  - Bubble sort
  - Selection sort
  - Insertion sort
  - Merge sort

### Notes
In our last conversation on [Arrays](https://github.com/Ada-Developers-Academy/textbook-curriculum/blob/master/04-cs-fundamentals/classroom/Arrays.md), we saw how having the data set sorted improved the algorithms we could use. e.g. <strong>Finding an element with minimum or maximum value</strong> went from a *O(n)* algorithm for unsorted array to an *O(1)* algorithm for a sorted array. Similarly, <strong>binary search</strong> which is possible on sorted data set is an *O(log n)* algorithm as compared to *O(n)* <strong>linear search</strong> algorithm. There are also other everday examples where we expect the data set to be sorted e.g. last names sorted from 'a' through 'z', words in a dictionary, test scores sorted in descending order, employee ids sorted in ascending order etc.

Sorting is ordering a list of elements. We can distinguish two types of sorting. If the number of elements is small enough to fit in the main memory, sorting is called *internal sorting*. If the number of elements is larger than can fit in the main memory, some of them will stay in the external storage while the sorting algorithm works and is called *external sorting*. We'll scope our conversation to a few internal sorting algorithms.

#### Bubble Sort
The bubble sort algorithm is a simple sorting algorithm that repeatedly steps through the list to be sorted, compares each pair of adjacent items and swaps them if they are in the wrong order. As the algorithm proceeds, the largest element gets bubbled to the top of the array after each iteration through the outer loop. The algorithm repeats this process until it makes a pass all the way through the list.</br>
**Example implementation:**
```ruby
def bubble_sort(array, length)
  i = 0
  while i < length-1 # outer loop
    j = 0
    while j < length-i-1 # inner loop
      if array[j] > array[j+1] # swap
        temp = array[j]
        array[j] = array[j+1]
        array[j+1] = temp
      end
      j += 1
    end
    i += 1
  end
end
```
<strong>Example:</strong> Consider the initial unsorted array [99, 45, 35, 40, 16, 50, 11, 7, 90]. Here's one iteration through the outer loop of the algorithm (i.e. while *i* is *0* and *j* ranges from *0* to *8*).</br>
&nbsp;&nbsp;&nbsp;&nbsp;[<strong>99, 45</strong>, 35, 40, 16, 50, 11, 7, 90]</br>
&nbsp;&nbsp;&nbsp;&nbsp;[45, <strong>99, 35</strong>, 40, 16, 50, 11, 7, 90]</br>
&nbsp;&nbsp;&nbsp;&nbsp;[45, 35, <strong>99, 40</strong>, 16, 50, 11, 7, 90]</br>
&nbsp;&nbsp;&nbsp;&nbsp;[45, 35, 40, <strong>99, 16</strong>, 50, 11, 7, 90]</br>
&nbsp;&nbsp;&nbsp;&nbsp;[45, 35, 40, 16, <strong>99, 50</strong>, 11, 7, 90]</br>
&nbsp;&nbsp;&nbsp;&nbsp;[45, 35, 40, 16, 50, <strong>99, 11</strong>, 7, 90]</br>
&nbsp;&nbsp;&nbsp;&nbsp;[45, 35, 40, 16, 50, 11, <strong>99, 7</strong>, 90]</br>
&nbsp;&nbsp;&nbsp;&nbsp;[45, 35, 40, 16, 50, 11, 7, <strong>99, 90</strong>]</br>
&nbsp;&nbsp;&nbsp;&nbsp;[45, 35, 40, 16, 50, 11, 7, 90, 99]</br>
As you can see, the largest element, 99 gets bubbled to the top. In subsequent iterations through the outer loop, the next largest values will get bubbled to the top the next i.e. *n-i-1* position with increasing values of *i*.

<strong>Analysis:</strong> The time complexity of Bubble sort is *O(n^2)*
- The inner most swap conditional statement is *O(1)*
- The inner loop runs *i* times i.e. *O(i)* time complexity
- The outer loop runs from *i* = *0* to *n* 
Overall, the inner loop runs *n-1* times during the first iteration of the outer loop, *n-2* times during the second iteration through the outer loop, and so on. i.e. *n-1 + n-2 + n-3 + ... + 3 + 2 + 1* = *n(n-1)/2* = *O(n^2)* </br>
**Note 1**: The mathematical proof is out of scope for our discussion. For those curious, see [step 4 on wikihow](http://www.wikihow.com/Sum-the-Integers-from-1-to-N)</br>
**Note 2**: The best case time complexity for Bubble sort can be improved to be *O(n)* (for already sorted arrays) by optimizing this algorithm. Read further on [GeeksForGeeks: Bubble Sort](http://www.geeksforgeeks.org/bubble-sort/)

#### Selection Sort
The selection sort works by selecting the smallest unsorted item remaining in the list, and then swapping it with the item in the next position to be filled.

The selection sort works as follows: you look through the entire array for the smallest element. Once you find it, you swap this smallest element found with the first element of the array. Then you look for the smallest element in the remaining array (the sub-array without the first element) and swap this element found with the second element. Then you look for the smallest element in the remaining array (the sub-array without the first and second elements) and swap that element with the third element, and so on. </br>
Here's an example:</br>
![Selection Sort Example](images/selection-sort.png)

**Example implementation:**
```ruby
def selection_sort(array, length)
  i = 0
  while i < length-1
    min_index = i
    j = i+1
    while j < length
      if array[j] < array[min_index]
        min_index = j
      end
      j += 1
    end
    if min_index != i
      temp = array[min_index]
      array[min_index] = array[i]
      array[i] = temp
    end
    i += 1
  end
end
```
<strong>Example:</strong> Consider the initial unsorted array [99, 45, 35, 40, 16, 50, 11, 7, 90]. Here's what it looks like before and after each iteration of the outer loop.</br>
&nbsp;&nbsp;&nbsp;&nbsp;[**99**, 45, 35, 40, 16, 50, 11, **7**, 90]&nbsp;&nbsp;*i=0; min_index=7*</br>
&nbsp;&nbsp;&nbsp;&nbsp;[7, **45**, 35, 40, 16, 50, **11**, 99, 90]&nbsp;&nbsp;*i=1; min_index=6*</br>
&nbsp;&nbsp;&nbsp;&nbsp;[7, 11, **35**, 40, **16**, 50, 45, 99, 90]&nbsp;&nbsp;*i=2; min_index=4*</br>
&nbsp;&nbsp;&nbsp;&nbsp;[7, 11, 16, **40**, **35**, 50, 45, 99, 90]&nbsp;&nbsp;*i=3; min_index=4*</br>
&nbsp;&nbsp;&nbsp;&nbsp;[7, 11, 16, 35, **40**, 50, 45, 99, 90]&nbsp;&nbsp;*i=4; min_index=4*</br>
&nbsp;&nbsp;&nbsp;&nbsp;[7, 11, 16, 35, 40, **50**, **45**, 99, 90]&nbsp;&nbsp;*i=5; min_index=6*</br>
&nbsp;&nbsp;&nbsp;&nbsp;[7, 11, 16, 35, 40, 45, **50**, 99, 90]&nbsp;&nbsp;*i=6; min_index=6*</br>
&nbsp;&nbsp;&nbsp;&nbsp;[7, 11, 16, 35, 40, 45, 50, **99**, **90**]&nbsp;&nbsp;*i=7; min_index=8*</br>
&nbsp;&nbsp;&nbsp;&nbsp;[7, 11, 16, 35, 40, 45, 50, 90, 99]&nbsp;&nbsp;*sorting complete*</br>

<strong>Analysis:</strong> The time complexity of Selection sort is *O(n^2)*. Each of the nested loops has an upper bound defined by the count of elements, *n* in the list to be sorted.

#### Insertion Sort
The insertion sort algorithm works by inserting each item into its proper place to form the sorted list. The simplest implementation of this requires two list structures - the source list and the list into which sorted items are inserted. One entry is removed at a time and then each is inserted into a sorted part (initially empty). To save memory, most implementations use an in-place sort that works by moving the current item past the already sorted items and repeatedly swapping it with the preceding item until it is in place. </br>
Here's an example:</br>
![Insertion Sort Example](images/insertion-sort.png)

**Example implementation:**
```ruby
def insertion_sort(array, length)
  i = 1
  while i < length
    to_insert = array[i]
    j = i
    # search in the sorted portion of the array
    # for the correct position to insert array[i]
    while j > 0 && array[j-1] > to_insert
      array[j] = array[j-1]
      j -= 1
    end
    array[j] = to_insert
    i += 1
  end
end
```
<strong>Example:</strong> Consider the initial unsorted array [99, 45, 35, 40, 16, 50, 11, 7, 90]. Here's what it looks like before and after each iteration of the outer loop. The sorted sub-array is **bolded**</br>
&nbsp;&nbsp;&nbsp;&nbsp;[**99**, 45, 35, 40, 16, 50, 11, 7, 90]</br>
&nbsp;&nbsp;&nbsp;&nbsp;[**45, 99**, 35, 40, 16, 50, 11, 7, 90]</br>
&nbsp;&nbsp;&nbsp;&nbsp;[**35, 45, 99**, 40, 16, 50, 11, 7, 90]</br>
&nbsp;&nbsp;&nbsp;&nbsp;[**35, 40, 45, 99**, 16, 50, 11, 7, 90]</br>
&nbsp;&nbsp;&nbsp;&nbsp;[**16, 35, 40, 45, 99**, 50, 11, 7, 90]</br>
&nbsp;&nbsp;&nbsp;&nbsp;[**16, 35, 40, 45, 50, 99**, 11, 7, 90]</br>
&nbsp;&nbsp;&nbsp;&nbsp;[**11, 16, 35, 40, 45, 50, 99**, 7, 90]</br>
&nbsp;&nbsp;&nbsp;&nbsp;[**7, 11, 16, 35, 40, 45, 50, 99**, 90]</br>
&nbsp;&nbsp;&nbsp;&nbsp;[**7, 11, 16, 35, 40, 45, 50, 90, 99**]</br>

<strong>Analysis:</strong> In sorting the most expensive part is a comparison of two elements. Insertion sort algorithm requires
- 0 comparisons to insert the first element
- 1 comparison to insert the second element
- 2 comparisons to insert the third element
- ... and so on
- *n-1* comparisons (worst case) to insert the last element
Overall, this is *1 + 2 + 3 + ... + (n-1)* = *O(n^2)*

The insertion sort has a complexity of O(n^2). Unlike selection sort, insertion sort has a best case time complexity of O(n) when the items are already sorted. In other words, insertion sort runs in linear time on a nearly sorted list of elements.

#### Merge Sort
Merge sort is a *divide-and-conquer* algorithm. It involves the following three stages:
1. **Divide** the array into two sub-arrays at each step until each sub-array is of size one.
2. **Sort** each sub-array. (An array of size one is sorted by default.)
3. **Merge** the sub-arrays into one array by combining two sub-arrays into one at each step.</br></br>

This is usually done by keeping track of three indices in the array: *starting index*, *ending index* and *midway index* as shown in the image below. </br></br>
![Merge Sort Example](images/MergeSort.png)
</br>As you can see in the image above, in the first *divide* step, the original array of size eight gets divided into two sub-arrays of size four each. This is done by setting *starting index* to *0*, the index of the first element in the array and the *ending index* set to the index of the last element in the array. The *midway index* is then computed using the formula: </br>
&nbsp;&nbsp;&nbsp;&nbsp;*midway index* = (*starting index* + *ending index*)/2

For the first *divide* step, the *midway index* will be *(0+7)/2* i.e. *3* (by considering the floor of *3.5*).</br>
In the next *divide* step, we have two sub-arrays, one ranging in index from *0* to *3* and the other ranging in index from *4* to *7*. The sub-arrays are not yet of size one. So, the same action gets repeated to compute the *midway index*. This *divide* stage continues until the original array of size *n* is reduced to sub-arrays of size *1* each.

A sub-array of size one is trivially, and by default sorted.

The *merge* stage starts by combining two sub-arrays at a time. While combining the sub-arrays containing *7* and *2* respectively, the values in each is compared, the smaller value i.e. *2* is written to the lower index, and the higher value i.e. *7* is written to the higher index. The mergining process continues in this manner. An auxiliary array of size *n* is often used to faciliate the merge steps. 

Consider the two sub-arrays *[1, 2, 7, 8]* and *[3, 5, 6, 9]* in the final merge step in our example image above.
- We start with comparing *1* with *3*. The smaller value, *1* gets written to the auxiliary array. (Auxiliary array: *[1]*)
- Next, we compare *2* with *3*. *2* gets written to the auxiliary array. (Auxiliary array: *[1, 2]*)
- Next, we compare *7* with *3*. *3* gets written to the auxiliary array. (Auxiliary array: *[1, 2, 3]*)
- Next, we compare *7* with *5*. *5* gets written to the auxiliary array. (Auxiliary array: *[1, 2, 3, 5]*)
- Next, we compare *7* with *6*. *6* gets written to the auxiliary array. (Auxiliary array: *[1, 2, 3, 5, 6]*)
- Next, we compare *7* with *9*. *7* gets written to the auxiliary array. (Auxiliary array: *[1, 2, 3, 5, 6, 7]*)
- Next, we compare *8* with *9*. *8* gets written to the auxiliary array. (Auxiliary array: *[1, 2, 3, 5, 6, 7, 8]*)
- At this point, all elements of the first sub-array have been merged. So, all remaining elements of the second sub-array get copied over linearly to the auxiliary array. In this case, only one element is left in the second sub-array. So, *9* gets copied over to the auxiliary array. (Auxiliary array: *[1, 2, 3, 5, 6, 7, 8, 9]*)

This two-way merging continues until there are no more sub-arrays and the orignal array is completely soorted. Finally, the auxiliary array gets linearly copied back to the original array.

<strong>Analysis:</strong> The time complexity of merge sort is *(n log n)*. Let's look closer to understand this.
- **Divide**: Finding the midway index is a straightforward computation (*midway index* = (*starting index* + *ending index*)/2). This takes constant time regardless of the subarray.
- **Merge**: Merging a total of *n* elements takes *O(n)* time. If there are two sub-arrays of size *n/2* each, then we will compare one element from one sub-array with another element from the second sub-array and one of the two will get copied. This step will continue until all are copied, taking a total of *O(n)* time.
- As the sub-problems get smaller, the number of sub-problems doubles at each level, but the merging time halves. The doubling and halving cancel each other out and so the merging takes *O(n)* time at each level of the merge steps (as seen in the image above). 
- **Base case**: In the base case, we have sub-arrays of size *1* and a total of *n* subarrays. It takes *O(1)* time to sort an array of size one. Overall, merging at base level is *O(n)* time, just like any other level.
- **Count of levels**: Starting with *n* elements and reducing by half at each level, until we reach one element sized array takes *log n* steps. Similarly, starting with sub-arrays of one element each and combining two sub-arrays at a time until we reach an array of *n* elements also takes *log n* steps.
Overall, each level takes *O(n)* time. There are *O(log n)* such levels. Resulting in an overall time complexity of O(n log n) for merge sort.

Note: We will look closer at merge sort and its implementation when we discuss *Recursive algorithms* in the future.

#### Concluding Notes
- There are several sorting algorithms available. Whilst we reviewed four of them, you can learn more about the rest on [geeksforgeeks.org/sorting-algorithms/](http://www.geeksforgeeks.org/sorting-algorithms/)
- Not all sorting algorithms are created equal. If the array size is relatively small, insertion sort works faster in practice than merge sort. For larger values of *n*, merge sort does much better than the other sorting algorithms we looked at. Watch this [sorting algorithms' comparison demo](https://www.youtube.com/watch?v=ZZuD6iUe3Pc) and this [visualization](https://www.cs.usfca.edu/~galles/visualization/ComparisonSort.html)

### Additional Reference reading
+ [Selection sort on Khan Academy](https://www.khanacademy.org/computing/computer-science/algorithms/sorting-algorithms/a/sorting)
+ [Insertion sort on Khan Academy](https://www.khanacademy.org/computing/computer-science/algorithms/insertion-sort/a/insertion-sort)
+ [Merge sort on Khan Academy](https://www.khanacademy.org/computing/computer-science/algorithms/merge-sort/a/divide-and-conquer-algorithms)
+ [Eugene Wang's blog post on "Not all sort algorithms are created equal"](http://eewang.github.io/blog/2013/04/22/sort-algorithms/)

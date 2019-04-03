# CS Fundamentals Introduction
This is the introductory lesson for Computer Science Fundamentals. In this series, we will be primarily studying Data Structures and Algorithms.

## Prerequisities
Before continuing with this lesson, you should have completed:
- [JumpStart](https://github.com/Ada-Developers-Academy/jump-start) and [JumpStart Live](https://github.com/Ada-Developers-Academy/jump-start-live) curriculums and all the included exercises.
- Lesson and exercises in [Essential mathematics for software engineers](https://github.com/Ada-Developers-Academy/textbook-curriculum/blob/master/04-cs-fundamentals/homeworks.md#essential-mathematics)

## Lesson flow
- Read the [notes](#notes)
- Complete the [exercises](#exercises)
- See what's [next](#next-lessons)

## Notes
Consider the task of organizing student account information. Here's the data we want to keep track of:

Name           | Id           | Email Address                        |
:------------- | :----------- | :-----------------------------------
Rosie Martinez | 123256       | rmartinez256@adadev.org
Joe Liu        | 349222       | jliu222@adadev.org
Sally Sue      | 999999       | ssue999@adadev.org
Bob Johnson    | 111112       | bjohnson112@adadev.org
Delia Agho     | 726488       | dagho488@adadev.org

<b>Question</b>: For a data set like the one above, take some time to think about the various ways one could organize this information. Are there any advantages or disadvantages to the different approaches you considered?

Let's start with observing what we have. The data set above can be viewed as a <b>table</b> of data. There are three distinct <b>columns</b>: _Name_, _Id_ and _Email Address_. Each <b>row</b> contains information for one specific student. To scale the problem and allow for information of more students, we simply need to add more rows.

Next, let's consider the options we could explore. As we learned in [JumpStart](https://github.com/Ada-Developers-Academy/jump-start) and [JumpStart Live](https://github.com/Ada-Developers-Academy/jump-start-live) curriculums, to allow the data to scale to more students, leveraging _arrays_ or _hashes_ could be a good way to approach this problem.

### Synchronized Arrays
A simple approach would be to consider having an array for each column above. The three arrays, one for names, one for ids and one for email addresses, will need to be kept synchronized.

```ruby
    names = ["Rosie Martinez", "Joe Liu", "Sally Sue"]
    ids = [123256, 349222, 999999]
    email_addresses = ["rmartinez256@adadev.org", "jliu222@adadev.org", "ssue999@adadev.org"]
```

The overhead of having to keep them synchronized also becomes the challenge for this approach. Anytime we need to reorder any of the arrays, e.g. sort the student names alphabetically or sort the student ids in ascending order, we will need to accordingly update the other two arrays such that the information at a given index in all of the arrays continues to remain for the same student.

### Array of hashes
Another approach to organize our student data would be to consider each of the column names as keys within a hash. We create a separate hash for each student and organize all the student hashes within an array. This is how the code might look like if we were to structure our data as _an array of hashes_:

```ruby
    # Student account generator data as an array of hashes
    students_data_array = [
        {
        name: "Rosie Martinez",
        id: 123256,
        email: "rmartinez256@adadev.org"
        },
        {
        name: "Joe Liu",
        id: 349222,
        email: "jliu222@adadev.org"
        },
        {
        name: "Sally Sue",
        id: 999999,
        email: "ssue999@adadev.org"
        }
    ]

    puts "Here's the student data array:"
    puts students_data_array
    puts
```

This approach allows to sort information more easily based on a criteria. Here's one way we could organize our data alphabetically based on first names of the students:

```ruby
    # Arrays allow for sorting information according to our criteria
    # Let's organize the data alphabetically based on first name
    puts "Here's the student data array in ascending first name order"

    # implements selection sort on name value
    (students_data_array.count - 1).times do |j|
    # for each index in the array, select the right data set for that index
    # Note: if all except the last index have the right data, then by default
    #       the last index will have the right data. That's why this loop runs
    #       (student count - 1) times.
        select_index = j # assume that at index j, the correct data is present
        i = j + 1 # starting at the index following the current index, j

        # go through all entries after index j to check if any data is better suited
        # for index j based on ascending first name criteria
        while i < students_data_array.count
            if students_data_array[select_index][:name] > students_data_array[i][:name]
            # found a better data to place at selected index j
            select_index = i
            end
            i += 1
        end

        if !(select_index == j) # we found a better data set for index j
            # swap data at index j with data at select_index
            temp = students_data_array[j]
            students_data_array[j] = students_data_array[select_index]
            students_data_array[select_index] = temp
        end
    end
    puts students_data_array
```
<b>Aside</b>: Read further on [sorting algorithms](https://github.com/Ada-Developers-Academy/textbook-curriculum/blob/master/04-cs-fundamentals/classroom/Sorting.md)

The array of hashes approach does fairly well when the operation that we are looking for is sorting the data using a certain criteria. However, what if we wanted to look up information for a particular student? Let's say we have 1000 students and we want to find out the information for one of them by name. We will need to scan down the array from index 0 onwards, comparing the name value in the hash with the one we are looking for, until we find the right name. In the worst case scenario, the name we are looking for could be at the last index.

### Hash of hashes
If looking up information for a particular student given their name, is going to be the most frequent operation we will be performing, then, organizing our data as a _hash of hashes_ would serve to our benefit.

This is how the code might look like if we wanted to organize our data as _a hash of hashes_:

```ruby
    # Student account generator data as a hash of hashes
    students_data_hash = {
        "Rosie Martinez" => {
            id: 123256,
            email: "rmartinez256@adadev.org"
        },
        "Joe Liu" => {
            id: 349222,
            email: "jliu222@adadev.org"
        },
        "Sally Sue" => {
            id: 999999,
            email: "ssue999@adadev.org"
        }
    }

    puts "Here's the student data hash"
    puts students_data_hash
```
Because we have organized the outer hash with student names as the key, it allows us to do quick look ups on student names like so:
```ruby
    # Hashes allow us to do quick look ups
    student_lookup = true
    while student_lookup
        print "Enter the full name of the student whose information you'd like to have: "
        name_key = gets.chomp
        if students_data_hash[name_key]
            puts "Here's the information for #{name_key}"
            puts students_data_hash[name_key]
        else
            puts "Information not found for #{name_key}"
        end

        puts "Would you like to do another look up? Enter 'y' or 'Y' for yes."
        student_lookup = (gets.chomp.downcase == 'y')
    end
```

## Take aways
1. <b>Arrays</b> and <b>hashes</b> are good ways to organize data. Each of them have their benefits and limitations.
    + Array is an <b>ordered</b> list of items. The ordering is based on <b>index</b>ing.
    + Hash is an <b>unordered</b> list of key-value pair. The <b>key</b> is not limited to 0 and positive integers.
    + Arrays allow for sorting of information.
    + Hashes allow for quick look up based on the key.
1. As a result, _array of hashes_, or _hash of hashes_ are both viable approaches to organizing the information we have about the students. However, depending on which operation is going to be more frequent on our data set i.e. ordering of information or quick look ups, we will choose one approach over the other.
1. Organizing information in different formats allows for certain algorithms (e.g. sort, search etc.) to be more efficient. In our study of <b>data structures</b>, we’ll take a look at
    + Well-known ways to organize data
    + Common data manipulation algorithms (sort, search, add, delete etc.) on a particularly structured data
    + Efficiency of these algorithms

## Exercises
Complete <b>part 1</b> of [Binary and Memory homeworks](https://github.com/Ada-Developers-Academy/textbook-curriculum/blob/master/04-cs-fundamentals/homeworks.md#binary-and-memory)

### Next Lessons
1. [Binary and Memory](https://github.com/Ada-Developers-Academy/textbook-curriculum/blob/master/04-cs-fundamentals/classroom/Binary.md)
1. [Arrays and efficiency of algorithms](https://github.com/Ada-Developers-Academy/textbook-curriculum/blob/master/04-cs-fundamentals/classroom/Arrays.md)
1. [Introduction to Data Structures](https://github.com/Ada-Developers-Academy/textbook-curriculum/blob/master/04-cs-fundamentals/classroom/Introduction%20to%20Data%20Structures.md)

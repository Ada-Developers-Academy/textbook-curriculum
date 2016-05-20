Epic List of Interview Questions
================================
_modified from:  [http://katemats.com/interview-questions/](http://katemats.com/interview-questions/)_

Below is a list of software engineer skills or areas that can be tested and evaluated in an interview context. Use the list below to help you get started, and you’ll soon be developing your own favorite questions and competencies for interviews. There are so many creative ways to test and evaluate skills when building your team – so let’s get started!

Table of Contents
=================
* [Algorithms - different approaches and performance](#algorithms---different-approaches-and-performance)
* [Problem Solving - like algorithms, only more general](#problem-solving---like-algorithms,-only-more-general)
* [Data Structures - Trees and Graphs](#data-structures---trees-and-graphs)
* [Data Structures - Queues and Stacks](#data-structures---queues-and-stacks)
* [Data Structures - Hash Tables](#data-structures---hash-tables)
* [Abstraction and Design](#abstraction-and-design)
* [Bits and Bytes](#bits-and-bytes)
* [Command Line and Scripting](#command-line-and-scripting)
* [Data Modeling and Data Schemas](#data-modeling-and-data-schemas)
* [SQL Queries - querying for data](#sql-queries---querying-for-data)
* [Networking](#networking)
* [System Design and Thinking](#system-design-and-thinking)
* [APIs](#apis)
* [Web Development](#web-development)
* [Reliability and Operations](#reliability-and-operations)
* [Software Engineering](#software-engineering)
* [Teamwork and Collaboration](#teamwork-and-collaboration)
* [Product Sense and Judgement](#product-sense-and-judgement)
* [Productivity and Ability to Get Things Done](#productivity-and-ability-to-get-things-done)
* [Focus on Quality](#focus-on-quality)
* [Curiosity](#curiosity)
* [Communication](#communication)
* [Passion](#passion)
* [Culture Fit](#culture-fit)
* [More interview questions](#more-interview-questions)

## Algorithms - different approaches and performance

- Write a function that takes two strings as arguments and returns a string containing only the characters found in both strings. Have them write 2 versions – one that is O(n\^2) and one that is O(n).

- You are given a sorted array and you want to find the number N. How do you do the search as quickly as possible (not just traversing each element)?

    - How would the performance of your algorithm change if there were lots of duplicates in the array?

- Given two different lists of objects, come up with an efficient solution to find the intersection of the two lists. ([solution](http://www.geeksforgeeks.org/write-a-function-to-get-the-intersection-point-of-two-linked-lists/))

- How do you find all the permutations of a string? What is the running time?

    - Now imagine that the string has repeating characters. How could you modify your solution so it would only find unique permutations as efficiently as possible?

- Given a list of numbers, assume each number represents the amount of time it takes to execute a task. How would you divide the tasks across two different servers to they finished in the same amount of time?

- Write a program that will find the 10 most popular words (popularity is determined by how often they occur) in a file. How can you do this efficiently in terms of space? In terms of time? // Sometimes it helps to tell them it is a really big file that can’t fit in memory if they get hung up on timing

- Given an array what is the longest contiguous increasing subsequence of elements? ([solution)](http://allaboutalgorithms.wordpress.com/2011/10/21/maximum-value-contiguous-subsequence-maximum-contiguous-sum/)

- Create an algorithm that will output the results of rolling a die (1-6) using a function that simulates a coin toss (1 or 2). All 6 outcomes should be equally likely. ([solution](http://users.dickinson.edu/~braught/courses/cs131s99/Lessons/16-Counters.html))

- Given an array of integers write a program that will determine if any two numbers add up to a specified number N. Do this without using hash tables. ([solution](http://stackoverflow.com/questions/2666654/how-to-write-an-algorithm-to-check-if-the-sum-of-any-two-numbers-in-an-array-lis), although some use hash tables)

## Problem Solving - like algorithms, only more general

- Given a dollar value come up with all the different ways to make change given the standard coin denominations ([solution](http://stackoverflow.com/questions/1106929/find-all-combinations-of-coins-when-given-some-dollar-value)).

- Count the 2’s between 0 and N. And every 2 digit counts as a 2, so if N was 7 the answer would be 1 (just the number 2), whereas if n was 23 there would be 7 2’s {2, 12, 20, 21, 22 (this counts for 2), 23}. // This is actually pretty challenging and one of my favorite questions to ask candidates that are doing really well in with lots of other questions. Getting the brute force answer is easy, coming up with an elegant solution takes a little more effort.

- How many degrees are there in the angle between the hour and minute hands of a clock when the time 4:15? // You can also use the current time if there is a clock in the room. You aren’t looking for a wild guess but for someone who can rationalize out the answer. For candidates rusty on geometry I will give them the number of degrees in a circle via hints

Here are some [other problem solving questions too](http://www.recruiter.com/i/the-best-interview-questions-ever/), if you need additional examples.

## Data Structures - Trees and Graphs

- How do you find the 7th element in a binary search tree? How do you generalize the function to find the Nth element? ([solution](http://stackoverflow.com/questions/2612362/nth-largest-element-in-a-binary-search-tree))

- Given two binary trees write a function that will compare the two and see if they are equal – both in terms of data and structure. ([solution](http://stackoverflow.com/questions/9597188/the-most-efficient-way-to-test-two-binary-trees-for-equality)) // You can also do just data or just structure to mix it up. Just make sure you know how to explain the differences.

- Write a function to determine if a graph contains a cycle. ([solution](http://www.geeksforgeeks.org/detect-cycle-in-a-graph/))

## Data Structures - Queues and Stacks

- Design and implement a stack. Implement the different methods: push, pop, retrieve the minimum element in constant time. ([solution](http://leetcode.com/2010/11/stack-that-supports-push-pop-and-getmin.html))

- Design a queue using stacks as the underlying data structure ([solution](http://www.impactinterview.com/2009/10/140-google-interview-questions/)). Implement a stack using queues as the underlying data structure ([solution](http://stackoverflow.com/questions/688276/implement-stack-using-two-queues)).

## Data Structures - Hash Tables

- How do hash tables work? What are some examples of real life hash tables? When is a hash table a poor data choice?

    - What are different ways of managing collisions?

    - Implement a hash table.

- Find the first non-repeated character in a string.

## Abstraction and Design

- Have you ever seen OO go bad? What happened? What elements of OO design are most prone to abuse and misuse? What are some ways to prevent these mishaps?

- Implement a game of tic-tac-toe. How do you represent the game board? What interfaces do you expose?

- You are tasked with designing software that runs and controls elevators. What interfaces and class objects would you use? What configuration options would you need for the software to work in skyscrapers, buildings with only one elevator, and buildings with banks of elevators? How would these use cases change the objects and interfaces in your design?

- Imagine you were tasked with designing a text editor (or instant messaging program). What are the primary functions? What are the various interfaces, classes, etc. that you would need to provide those functions? // and feel free to replace text editor with any common small program of your choosing (mobile apps make great examples)

## Bits and Bytes

- How much space would you need to store 1 billion phone numbers?

- Convert a binary (or hex, or any other base of your choosing) string to an integer. Convert an integer to binary (or hex, or any other base of your choosing).

- If you had a product catalog of 1 million items how much space would you need to store all of them? Assume each item has a title, a description and price. // feel free to set limits on the fields or your choosing, or ask the candidate to pick something reasonable.


## Command Line and Scripting

- Write a regular expression which matches a email address // You can use url, phone number, etc. instead of email address

- How would you find all the \*.plist files in a directory via the command line?

- What is a shell? What kind of shell do you use? Have you customized it all? If yes, what are some of your customizations?

- How do you view all the processes running on a Linux system? When might you want to do this?


## Data Modeling and Data Schemas

- Design a data schema for \[insert example here\]. // I like to use one of the products or features at my company, but you could also use familiar scenarios like: course catalog for students, a rental car database, a flight database for an airline, inventory for an ecommerce site, etc.

- Have you ever had to design a data model from scratch? What project was it? Was there ever any issues? What do you think you got really right, and what could have been improved?

## SQL Queries - querying for data

- What is a primary key?

- You know that data is in a particular table but you don’t know what the schema is for that table. How could you figure it out?

- What are some different kinds of joins? How do they work? Can you give examples?

- What is the difference between GROUP BY and ORDER BY?

- Write a query to delete duplicate rows from a table.

- For more SQL questions, [check out Jitbit’s guide here](http://www.jitbit.com/news/181-jitbits-sql-interview-questions/).


## Networking

- What are some common networking protocols and what makes them special? Any of the following will work: TCP, UDP, HTTP, DNS, but there are way more. // In the event the candidate starts to explain one you are less familiar with take notes and ask questions – you can verify their knowledge later and test their communication now.

- A customer complains your website is slow. How do you troubleshoot the issue?

- Describe what happens when I type “google.com” into a browser and hit return. Be as detailed as possible.


## System Design and Thinking

- What are some alternate ways to store data besides using a relational database? Do you have any experience with other data stores? What was the use case? Why might you consider an alternate solution (to an relational DB) and what would be the downsides of doing so?

- What is the difference between stateless and stateful systems? How does this impact scaling?

- What is a cache? In your past projects, what types of caches were present? How would you decide if you should buy servers with more memory or disk space? How would you develop a cost model to help you make the decision? // This question is probably best for someone with some experience managing or having exposure to servers. You can still answer it without that knowledge of course, but there may be better questions.

## APIs

- Why are interfaces important to software and systems? What are some examples of "interfaces" you have built or used in a previous project?

- Describe a situation where you had to use a RESTful web service? What were the languages and technologies that you used? Did you learn anything from the experience?

- What are some qualities of a well designed API? How about a poorly designed one? // Feel free to replace the example with anything that involves data, hopefully something that relates to your product and business.

- How do you keep APIs secure? What are some considerations with API security?


## Web Development

- **JavaScript**

    - What JavaScript libraries (or frameworks if you would prefer) have you used?

    - Explain AJAX in as much detail as possible. How does it work? What have you used it for in the past?

    - You want to get a query string parameter from the browser’s URL, how would you do it?

    - What is the difference between document load and document ready events?

    - What are ways to write object oriented JavaScript? For example, explain how inheritance works.

- **HTML**

    - What are some of the building blocks of HTML5?

    - What is the difference between cookies, sessionStorage and localStorage?

- **CSS**

    - How do you organize CSS files? What are the pros and cons of this approach? Have you ever tried other ways?

    - How do you avoid duplicating colors or fonts in CSS, when those colors or fonts are applied to multiple elements? What are the pros and cons of that approach?

    - What is the CSS box model? (A: width/padding/border/margin)

    - What are some clearing techniques and when is it appropriate to use them?

    - What is the difference between “visibility:hidden” and “display:none”? What are the pros and cons of using “display:none”?

    - How does the browser determine where to place positioned elements?

- **Web Browsers**

    - What is responsive design? What is the difference between fixed and fluid layouts? What are some of the pros and cons with these designs?

    - How do you do browser compatibility testing?

    - What are some ways to prevent web browser caching?

    - What is your favorite browser? What sort of tools do you use to debug websites?

- What are some considerations in selecting font sizes? // This question is focused on accessibility

- How does the DOM work? Explain in as much detail as possible.

- What do you think of “hacks”? When should they be used in your code and when should they be avoided?

- What is MVC and why is it useful? When would MVC not be an appropriate design pattern choice?

- What are the advantages of client side rendering vs. server side rendering? If you were building our site which would you use and why?

- What does minification do?

- What are some ways to make websites faster? Name as many different techniques as you can.

- How do you test the performance of your code and/or web pages?

- What are some common security issues with web applications and how do you avoid them?

- What is the difference between Canvas and SVG? Do you have experience with either?

## Reliability and Operations

- Have you ever had someone let you down at work? What happened? How did you handle it? What did you learn and did it change the way you did things?

- Can you describe a stressful situation from a previous role. What you did to create a positive outcome? How do you manage stress in your daily work?

- Have you ever had a bug in your code that showed up in production? What happened? What did you learn from the experience?

- Tell me about a time when you had to go above and beyond the call of duty to complete your work.

- Tell me about a situation when you aren’t able to complete you work. What happened? What did you learn from the situation and experience?

- What is the purpose of retrospectives, and why are they useful? What are the attributes that make a great retrospective?

## Software Engineering

- How would you describe the software lifecycle at your last position? What did you like about it? What did you wish you could change?

- What is an example of a [sandbox](http://en.wikipedia.org/wiki/Sandbox_%28computer_security%29)? Have you ever used one? What is the purpose of one and what are some potential alternatives?

- What does refactoring mean to you? Why is it important and when have you done it? (Some candidates can even talk about different refactorings and design patterns here, but mostly I am looking for someone who wants to improve the code they write – as very few people ever get it all right the first time)

- Given the following variables: time, budget, customer happiness and best practices which are most important in a project? Give them an order and explain why.

- What is the advantages of best practices like continuous integration, automated testing, and code reviews? What are the disadvantages of these practices? (Feel free to insert your own best practices too, these are just examples.)

- Are you familiar with the concept of [convention over configuration](http://en.wikipedia.org/wiki/Convention_over_configuration)? What is an example?

- How do you design, develop and debug applications? What tools do you like to use best? Have you tried others before? What were the reasons you use the ones you do? // There is really no right answer here, it is mostly just about learning how they do their work, and how it fits into past projects. Good answers usually involve thoughtful responses on trade-offs, technology, and experience.

## Teamwork and Collaboration

- Give examples of project that were completed as a team. Were there any that went better than others? Why? What was different?

- What is the best way to collaborate on a coding project?

- Have you ever had to deal with features that involved multiple people working in the same areas? How did it go? Was there anything that could have been done to improve it?

- Do you do your best work alone or in a group? Does the type of work matter?

- What does it mean to be a good teammate? Have you ever had any bad teammates? If so, did you tell them and give the feedback?

- Have you ever had to work with someone else that didn’t pull their weight on a project? How did you handle it? Did things ever improve? If you had to do it all over again would you change anything?

- We are in the middle of a development cycle (or sprint if you use agile) and there is a major change in the functionality of a feature you have been working on. How do you respond? What questions do you ask?

## Product Sense and Judgement

- What is a really well designed website that you use? What makes it great? // This is also a great question to ask if you have a web browser and can pull it up and have the candidate walk you through it

- Describe the structure and contents of a design document. What do you consider the minimum amount of information for development to start building something? Give an example of when you didn’t have enough information, or when you had too much/unnecessary information.

- (For more questions on this note, there is an [amazing post here on hiring a product manager](https://www.kennethnorton.com/essays/productmanager.html) but a lot of the questions could easily be adapted here as well)

## Productivity and Ability to Get Things Done

- Tell me about a time you did something that you were really proud of but no one else knew about. // Ideally they should answer with some sort of cleanup work, like refactoring, or fixing other issues, or maybe even something as simple as cleaning up the kitchen. You want a sign that they care about work that is more than just the tasks they are assigned.

- How do you manage your tasks and stay organized?

- Tell me about a time when you were the most productive. What made that time special? Did you change anything about your day to day work to take advantage of those same attributes?

- You have been assigned to a project in a new technology you haven’t worked with before. How do you get started? Have you ever done this before? How did it go?


## Focus on Quality

- When do you consider a product to be finished? // My favorite response is ‘it’s never finished’ but anything about some level of testing or verification is generally acceptable.

- When do you know your code is ready for prime time (shipping to production)?

- Explain a feature or product. How would you test this feature (or product)? You can also ask how to test a specific function after a coding problem.

- You have just been put in charge of a big legacy piece of software with some serious maintenance issues. What do you do first? // This question works best if you have a product or example with some issues in mind – otherwise it can be a pretty abstract question.

- Have you ever done TDD? Do you like it? Why or why not?

- There are all different types of tests – unit tests, smoke tests, acceptance tests, integration tests, etc. What sort of tests have you written? What’s the difference between \[insert test here\] and \[insert different test here\]?

## Curiosity

- What was the last new technology or tool you learned? Where did you learn about it? Have you used it since?

- What is the last programming (or technical) book you read?

- When was the last time you got something wrong? How did you know? What did you learn from it?

## Communication

- Teach me about something for the next 10 minutes. // You are looking for them to select a topic they know (I generally don’t care if they are technical or not) and how well they communicate and break things down.

- How did you communicate progress in your previous role? Did that process always work? What could have been done differently to keep everyone on the same page?

- Tell me about a time when you had a miscommunication at work. What happened? If you could do it all over again would you alter your actions? Why or why not?

- How would you explain the Internet to a child?

- Have you ever disagreed with your boss or manager? What did you do? If you haven’t had this happen, imagine that it did, how would you handle this situation?

- Explain the concept of cloud computing to my older (not-very-technical) mother. // I actually had to do this in real life and it was harder than I expected. Another example is explain a database to someone’s grandparents.

- Give me an example of a time when you were able to communicate and work with another person even when they may not have personally liked you (or vice versa).

## Passion

- Do you have any personal projects? Tell me about them. // This is probably one of my favorite and most important questions. When I hire I like to hire candidates who are very passionate about what they do, and so programming isn’t something they just do at their job. They are actually passionate about it and pursue their own projects outside of work.

- If money weren’t an issue and you had to work on a project for 3 months, what would you create?

- What are 3 big contributors to your success?

- Give me an example of a goal you set for yourself and how you achieved it.

## Culture Fit

- Tell me about 3 times you have failed. // Almost anyone can come up with 1 or 2, but it can be hard to think of 3. Be sure to wait and be quiet while the candidate thinks and ponders the answer – I often feel like the most insightful answers come towards the end of this question.

- What do you want to do in 5 years? How would this job fit into your plan and help you toward your goals?

- Why do you want to work at \[company name\]? Have you used our products? Is there a particular area or feature that got you excited?

- Give an example of when you completed a task without being asked. Can you give me another example? Another?

- Tell me about a time you improved a tool, task, or project you were working on. What was the circumstances? Why did you do it? Do you have any other examples?

## More interview questions

Here are a few lists of questions to check out. You can also just try searching for specific questions or skills that you are looking for – there is no shortage of questions to ask.

- <http://kundansingh.com/interview/>

- <https://sites.google.com/site/steveyegge2/five-essential-phone-screen-questions>

- <http://www.noop.nl/2009/01/100-interview-questions-for-software-developers.html>

- [http://www.joelonsoftware.com/articles/fog0000000073.html](http://www.joelonsoftware.com/articles/fog0000000073.htmlhttp://www.impactinterview.com/2009/10/140-google-interview-questions/)

- [http://www.impactinterview.com/2009/10/140-google-interview-questions/](http://www.joelonsoftware.com/articles/fog0000000073.htmlhttp://www.impactinterview.com/2009/10/140-google-interview-questions/)

- <http://www.hanselman.com/blog/NewInterviewQuestionsForSeniorSoftwareEngineers.aspx>

- Web Development focused: <http://darcyclarke.me/development/front-end-job-interview-questions/>

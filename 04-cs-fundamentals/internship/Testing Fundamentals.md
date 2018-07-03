# Testing Fundamentals
## Goals
+ Why should we care about testing?
+ Test classification and terminologies

## Testing terminologies
**Functional testing** focuses on ensuring that the software meets and provides all the required functionality. The specifications and requirements provided at the beginning of the software development cycle form the starting point for validating that the software provides all the needed functionality.

Let's consider an example where we are looking to test a function that reverses a string. To test this method, we invoke the method with different input parameters and compare the result with what we expect based on the definition of the method and on the input paramter passed. For example, "hello" passed as the input string should reverse the string to be "olleh", when "code" is passed in as input paramter, it should get reversed to be "edoc". We also need to be mindful of whether the requirements of the method specify to reverse the string in place or to return a new reversed string.

To make the most of the time available to test and ensure high quality, it makes sense to approach testing methodically. We could try thousands of different input-expected output combinations. However, not all combinations will help us cover different code flows in the program. We may not gain as much by testing "files" as an input parameter if we have already tested "hello" since both are strings with 5 characters. "files" and "hello" could be said to be in the same **equivalence class partition**. By leveraging **Equivalence Class Partitioning** we attempt to reduce the total number of test cases necessary by partitioning the input possibilities into a finite number of **equivalence classes**. At the top level, we could start with two equivalence classes; *valid* and *invalid* inputs to the program. Within each of these we can further assess additional partitions based on what we are lookign to test. **Boundary cases** or **edge cases** are the values at, immediately above or below the boundary or edge of an equivalence class.

**Black box testing** is a method of software testing that examines the functionality of an application, or function without peering into its internal structures or workings. Often, this approach is used to test public APIs and user interfaces. Black box testing may be performed by *manual* or *automated* tests.
**White box testing** (clear box testing, glass box testing) focuses on testing with complete knowledge of internal structure and code. Often, this approach is used to validate internal flow and interactions within the software. White box testing requires internal knowledge of the software being tested and programming skills.
With black box testing, one is aware of *what* the software is supposed to do but is not aware of *how* it does it. 
-**Black box testing** tests the interface
-**White box testing** tests the implementation details

**Code coverage** is a measure used to describe the degree to which the source code of a program is executed when a particular test suite runs. 
A program with high code coverage, measured as a percentage, has had more of its source code executed during testing which *suggests* it has a lower chance of containing undetected software bugs compared to a program with low code coverage. Note that higher code coverage doesn't always mean that all the code covered was validated.

**Unit testing**: Part of the software development process where the smallest testable portion of the application is tested independently.
**Integration testing**: Part of the software development process where multiple units are tested as a group.
**End-to-end testing**: is a technique used to test whether the flow of an application right from start to finish is behaving as expected. 

**Performance testing**
- Determine how a system performs in terms of responsiveness and stability under a particular workload.
- **Turnaround time**: amount of time taken to fulfill a request. 
- **Load test**: increase demand on the system.
- **Stress test**: increase demand beyond expected load that the system is designed for to assess thresholds.

**Reliability testing**: 
Test if we get the same result consistently.

**Security testing** is a process intended to reveal flaws in the security mechanisms of an information system that protect data and maintain functionality as intended. Due to the logical limitations of security testing, passing security testing is not an indication that no flaws exist or that the system adequately satisfies the security requirements.

**Localization testing** is the software testing process for checking the localized version of a product for that particular culture or locale settings. 
**Globalization testing** is to ensure that application can function in any culture or locale.

A **memory leak** is a type of resource leak that occurs when a computer program incorrectly manages memory allocations in such a way that memory which is no longer needed is not released.

A **memory access violation** or a **segmentation fault** occurs when a program attempts to access a memory location that it is not allowed to access, or attempts to access a memory location in a way that is not allowed (for example, attempting to write to a read-only location, or to overwrite part of the operating system).

A **Software Test Plan** is a document describing the testing scope and activities. It is the basis for formally testing any software/product in a project.
There’s often way more to test than can be covered.
- Test matrix considering combinations of input (machine configuration, software versions and different user flows) is often too large.
- Business need to release on-time (speedy release)
**Test prioritization** is therefore key to cover the most important tests before release.

**Test-driven development (TDD)** is a software development process that relies on the repetition of a very short development cycle: requirements are turned into very specific test cases, then the software is improved to pass the new tests, only. This is opposed to software development that allows software to be added that is not proven to meet requirements.
**Acceptance testing** is a test conducted to determine if the requirements of a specification or contract are met.
**User acceptance testing (UAT)** consists of a process of verifying that a solution works for the user. It is not system testing (ensuring software does not crash and meets documented requirements), but rather ensures that the solution will work for the user (i.e., tests that the user accepts the solution); software vendors often refer to this as "Beta testing".

**Regression testing** is a type of software testing that verifies that software previously developed and tested still performs correctly even after it was changed or interfaced with other software.
A software team may prioritize and categorize their automated tests to get the right set of regression tests run:
- On each check-in
- Before releasing to pre-production environment
- Before releasing to production environment
Consideration: Risk of regression vs. time needed to execute tests and analyze test results.

## Further reading and sources used for definitions above:
+ [What Is a Good Test Case? (Cem Kaner, J.D., Ph.D.)](http://www.kaner.com/pdfs/GoodTest.pdf)
+ [Black box vs. white box testing](https://technologyconversations.com/2013/12/11/black-box-vs-white-box-testing/)
+ TechTarget.com on [Unit Testing](http://searchsoftwarequality.techtarget.com/definition/unit-testing)
+ TechTarget.com on [Integration Testing](http://searchsoftwarequality.techtarget.com/definition/integration-testing)
+ TutorialsPoint on [End-to-end Testing](https://www.tutorialspoint.com/software_testing_dictionary/end_to_end_testing.htm)
+ Wikipedia on [Blackbox Testing](https://en.wikipedia.org/wiki/Black-box_testing)
+ Wikipedia on [Memory Leak](https://en.wikipedia.org/wiki/Memory_leak)
+ Wikipedia on [Access violation or Segmentation fault](https://en.wikipedia.org/wiki/Segmentation_fault)
+ Wikipedia on [Test driven development](https://en.wikipedia.org/wiki/Test-driven_development)
+ Wikipedia on [Acceptance testing](https://en.wikipedia.org/wiki/Acceptance_testing)
+ Wikipedia on [Regression testing](https://en.wikipedia.org/wiki/Regression_testing)
+ Guru99 on [Globalization and Localization testing](http://www.guru99.com/globalization-vs-localization-testing.html)
+ Wikipedia on [Security testing](https://en.wikipedia.org/wiki/Security_testing)
+ Software Testing Fundamentals on [Test planning](http://softwaretestingfundamentals.com/test-plan)
+ Wikipedia on [Code Coverage](https://en.wikipedia.org/wiki/Code_coverage)
+ Lee-Dohm on [Code Coverage](http://www.lee-dohm.com/2015/01/13/what-is-code-coverage-good-for/)

## Slide Deck
+ Slide Deck used in class</br>
<span xmlns:dct="http://purl.org/dc/terms/" property="dct:title"><a href="https://drive.google.com/file/d/0B__DV26QHsH4TGdKTVEtLWV5Njg/view?usp=sharing">Testing Fundamentals</a></span> is licensed under a <a rel="license" href="http://creativecommons.org/licenses/by-nc-nd/4.0/">Creative Commons Attribution-NonCommercial-NoDerivatives 4.0 International License</a>.</br>
<a rel="license" href="http://creativecommons.org/licenses/by-nc-nd/4.0/"><img alt="Creative Commons License" style="border-width:0" src="https://i.creativecommons.org/l/by-nc-nd/4.0/88x31.png" /></a><br /> 

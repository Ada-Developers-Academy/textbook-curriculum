# Testing with Guard and Minitest
We've already seen how to use Minitest to make test files and write automated tests to verify the behavior of our Ruby code. Now we will build on this foundation of automated tests to improve our "development workflow", using a tool called [Guard](https://github.com/guard/guard).

## Learning Goals
- Install Guard
- Optionally:
    - Understand what Guard is, and how it works with Minitest
    - Learn how Guard can increase the value of your automated tests

## What is Guard?
[Guard](https://github.com/guard/guard) is a _task runner_ which means that it's primary role is to automatically perform a task, such as have Minitest run our full test suite, or possibly a subset of it. In particular, Guard is a kind of task runner that is based on file watching -- it "watches" the files in our project, and runs tasks when they are changed. For Ada's projects we have configured Guard to run your tests whenever a code or test file is changed.

**NOTE**: Guard will only notice that your file has changed when you _save_ it in your editor.

## Install and start Guard
Before we can use Guard to automatically run our tests while we work on projects, we will need to install it. This can be done by installing two Gems:

```bash
$ gem install guard guard-minitest
```

### If you get an error

If you get the error: 

```bash
mkmf.rb can't find header files for ruby at /System/Library/Frameworks/Ruby.framework/Versions/2.3/usr/lib/ruby/include/ruby.h
```

This could be because your mac is on version [10.14](https://github.com/castwide/vscode-solargraph/issues/78).  

You may need to run:

```bash
$ open /Library/Developer/CommandLineTools/Packages/macOS_SDK_headers_for_macOS_10.14.pkg
```

Then try to reinstall guard.

### After installing guard

After we've got Guard installed, we can start it by running the `guard` command in a terminal. Leave this terminal window open while you work, and Guard will display the results of your tests whenever they are re-run automatically.

_Important_: You need to run `guard` from the "root" directory for the project (the directory which has the `Guardfile`).

## More details
### How Guard works with Minitest
Now that we know the purpose of the Guard tool, how can we use it to run our tests? Much like Rake, we have a configuration file to tell Guard what tasks to run, and what files to watch. Here's an example `Guardfile` that we use in Ada projects:

```ruby
guard :minitest, bundler: false, autorun: true, rubygems: false do
  # With Minitest Reporters
  watch(%r{^test/(.*)_test\.rb$})
  watch(%r{^lib/(.+)\.rb$})         { |m| "test/#{m[1]}_test.rb" }
  watch(%r{^test/test_helper\.rb$}) { 'test' }
end
```

While it's not important to understand all of this code (it's written using a Guard-specific style of Ruby, so it will look unfamiliar), we can spot a few details that indicate how Guard is working.

In particular, we have a line that says `guard :minitest`. This is how we indicate to Guard that one of its tasks is to run Minitest. The lines inside of the `do ... end` block attached to the Minitest line are how we tell Guard what files to watch.

The above example tells Guard to watch the `test/` and `lib/` folders, and to only run _relevant_ tests whenever a file is changed. Additionally, we tell Guard to run _all_ tests whenever the `test_helper.rb` file is changed.

An example of a useful `test/test_helper.rb` file would be:

```ruby
# test/test_helper.rb
require 'minitest/reporters'
require 'minitest/autorun'

Minitest::Reporters.use! Minitest::Reporters::SpecReporter.new

# Place `require_relative` commands for loading application code
#   Example:  require_relative '../lib/customer'
# ...
```

Again, it is not necessary to understand the code snippet above. Ada will provide an appropriate Guardfile as needed for any projects we assign.

### Why developers use Guard
So Guard can run our tests automatically as we work on our projects. Why is that worth all of this configuration file business?

Guard and similar tools are used by developers to help improve their "workflow". That is, the process we follow as developers. There are several schools of thought for software development processes, but a major one that we've emphasized at Ada is the Test-Driven Development process.

If you recall, the TDD process has three stages, which repeat in a cycle -- red, green, refactor. Since this is the process that we should follow in order to develop software with TDD, a tool that helps us to automatically follow this process can be a serious time-saver.

So that is the benefit for experienced developers using TDD -- they are running their tests so frequently as they work on code, that a tool to do it automatically improves their productivity. But what about Ada students?

### How Guard can help us learn
In addition to the productivity gains that Guard and get us if we're frequently running our tests, it can help to reinforce good development practices, and even make debugging easier!

Guard helps to reinforce good development practices because we're always in the red-green-refactor cycle. Whenever we change some code and Guard runs my tests again we're either presented with one or more test failures (red) or we're presented with all tests passing (green or possibly refactor).

However, if we don't use Guard and thus don't run our tests after making a change, then we're not at any stage in the TDD cycle. So using Guard can help us to always be practicing TDD, and reinforce the good habits of that process.

Finally, Guard can help make debugging easier. It does not do this by helping us to understand our code better (and thus recognize bugs more readily). Instead, it helps us _find_ bugs earlier and easier. Sometimes finding the source of a bug is a major part of the debugging process, especially in larger codebases.

But how does Guard actually help us find bugs? It helps us find bugs by showing us that we have a bug sooner than we might otherwise find out. Consider two possible development processes, both starting from the same scenario: The developer is given a specification or other document with instructions for a new feature that needs to be implemented. This would be similar to working on one wave from an Ada project.

* Process A: The developer starts working on the feature and writes all of the code and tests for that feature. They then run their test suite and notice several tests are failing. The developer picks the first failing test and begins to work on debugging to fix their code and pass the test. In this situation they need to consider that the bug they need to fix could be in _any_ of the code they wrote for that feature. And in fact, there may be multiple bugs which interfere and build ontop of each other.

* Process B: The developer starts working on the feature, and runs Guard in the background. When they write a line of code to implement some part of the feature, their tests are run by Guard. If that line included a bug, they would notice right away because one or more tests failed (assuming that they have tests for this new line of code). At that point, they know that the bug exists in the one line that they just wrote -- a major leg up in finding that bug. Additionally, if the developer takes the time to fix the bug right away they are preventing themselves from creating more bugs that compound with each other and make the debugging process that much harder.

This principle -- the more frequently we run our code, the easier our debugging work will be -- is not specific to Guard, but the automation that it enables helps to reinforce this principle and to ensure you build it into your development practice.

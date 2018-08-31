# Testing with Guard and Minitest
We've already seen how to use Minitest to make spec files and write automated tests to verify the behavior of our Ruby code. Now we will build on this foundation of automated tests to improve our "development workflow", using a tool called [Guard](https://github.com/guard/guard).

## Learning Goals
- Install Guard
- Optionally:
    - Understand what Guard is, and how it works with Minitest
    - Learn how Guard can increase the value of your automated tests

## What is Guard?
[Guard](https://github.com/guard/guard) is a _task runner_ which means that it's primary role is to automatically perform a task, such as have Minitest run our full test suite, or possibly a subset of it. In particular, Guard is a kind of task runner that is based on file watching -- it "watches" the files in our project, and runs tasks when they are changed. For Ada's projects we have configured Guard to run your tests whenever a code or spec file is changed.

**NOTE**: Guard will only notice that your file has changed when you _save_ it in your editor.

## Install and start Guard
Before we can use Guard to automatically run our tests while we work on projects, we will need to install it. This can be done by installing two Gems:

```bash
$ gem install guard guard-minitest
```

After we've got Guard installed, we can start it by running the `guard` command in a terminal. Leave this terminal window open while you work, and Guard will display the results of your tests whenever they are re-run automatically.

_Important_: You need to run `guard` from the "root" directory for the project (the directory which has the `Guardfile`).

## More details
### How Guard works with Minitest
Now that we know the purpose of the Guard tool, how can we use it to run our tests? Much like Rake, we have a configuration file to tell Guard what tasks to run, and what files to watch. Here's an example `Guardfile` that we use in Ada projects:

```ruby
guard :minitest do
  # with Minitest::Spec
  watch(%r{^spec/(.*)_spec\.rb$})
  watch(%r{^lib/(.+)\.rb$})         { |m| "spec/#{m[1]}_spec.rb" }
  watch(%r{^spec/spec_helper\.rb$}) { 'spec' }
end
```

While it's not important to understand all of this code (it's written using a Guard-specific style of Ruby, so it will look unfamiliar), we can spot a few details that indicate how Guard is working.

In particular, we have a line that says `guard :minitest`. This is how we indicate to Guard that one of its tasks is to run Minitest. The lines inside of the `do ... end` block attached to the Minitest line are how we tell Guard what files to watch.

The above example tells Guard to watch the `spec/` and `lib/` folders, and to only run _relevant_ tests whenever a file is changed. Additionally, we tell Guard to run _all_ tests whenever the `spec_helper.rb` file is changed.

Again, it is not necessary to understand the code snippet above. Ada will provide an appropriate Guardfile as needed for any projects we assign.

### Why developers use Guard
So Guard can run our tests automatically as we work on our projects. Why is that worth all of this configuration file business?

Guard and similar tools are used by developers to help improve their "workflow". That is, the process we follow as developers. There are several schools of thought for software development processes, but a major one that we've emphasized at Ada is the Test-Driven Development process.

If you recall, the TDD process has three stages, which repeat in a cycle -- red, green, refactor. Since this is the process that we should follow in order to develop software with TDD, a tool that helps us to automatically follow this process can be a serious time-saver.

So that is the benefit for experienced developers using TDD -- they are running their tests so frequently as they work on code, that a tool to do it automatically improves their productivity. But what about Ada students?

### How Guard can help us learn
In addition to the productivity gains that Guard and get us if we're frequently running our tests, it can help to reinforce good development practices, and even make debugging easier!

<!-- TODO: Finish explaining how Guard reinforces following TDD cycle, and how we can see that more frequently running tests means we catch and fix bugs faster, when they're simpler and easier to find. -->

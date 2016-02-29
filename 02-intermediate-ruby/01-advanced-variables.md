## Advanced Variables
## Learning Goals
- Review the two kinds of _variables_ we've encountered so far
  - _Local Variables_ and 
  - _Instance Variables_
- Introduce the three other kinds of _variables_ that exist in Ruby
  - _Class Variables_
  - _Global Variables_ and
  - _Constants_


## There are 5 types of variables in Ruby

| Type             | Begins With        | Scope                                    |
|:----------------:|:------------------:|------------------------------------------|
|Local variable    | **a-z** *or* **_** | Available only within the immediate scope.
|Instance variable | **@**              | Available to a specific instance of a class
|Class variable    | **@@**             | Available anywhere in a specific class (including all instances) (avoid me)
|Global variable   | **$**              | Available everywhere (don't use me).
|Constant          | **ALL_CAPS**       | Available in the scope of their definition

### Local Variable
- Local variables start with a lowercase letter or an underscore.
- Local variables are only available within the block of its initialization.
- Local variables will raise an error if they are read before they're created
- Local variables are used often

```ruby
my_name = "<3 Jeremy!"
```

### Instance Variables
- Instance variables begin with `@`
- Instance variables are available to the object of it's initialization
- Instance variables are also used very commonly

```ruby
class Ghost
  attr_reader :name

  def initialize(name_var)
    @name = name_var
  end
end
```

### Class Variables
- Class variables begin with `@@`
- Class variables are available to the entire class (in any method)
- Class variables will raise an error if they are read before they're created
- Class variables can cause problem down the road (**avoid using them**)
- Class variables are sometimes used for application configuration

```ruby
class Ghost
  @@ghosts_in_the_world = 0
  attr_reader :name

  def initialize(name_var)
    @@ghosts_in_the_world +=1
    @name = name_var
  end

  def how_many_ghosts
    @@ghosts_in_the_world
  end
end
```

### Global Variables
- Global variables begin with `$`
- Global variables are available to the entire application
- Global variables are dangerous **Don't use them.**

```ruby
$dead = true

class Ghost

  def is_dead?
    $dead # this is bad
  end

end
```

#### Predefined Global Variables
Ruby creates and maintains a lot of global variables for managing its internal configuration. It's good to know these exist, but you won't interact with them often.

- __$!__ The exception information message set by the last 'raise' (last exception thrown).
- __$@__ Array of the backtrace of the last exception thrown.
- __$&__ The string matched by the last successful pattern match in this scope.
- __$`__ The string to the left of the last successful match.
- __$'__ The string to the right of the last successful match.
- __$+__ The last bracket matched by the last successful match.
- __$1__ to __$9__ The Nth group of the last successful regexp match.
- __$~__ The information about the last match in the current scope.
- __$=__ The flag for case insensitive, nil by default (deprecated).
- __$/__ or __$-0__ The input record separator, newline by default.
- __$\__ The output record separator for the print and IO#write. Default is nil.
- __$__, The output field separator for the print and Array#join.
- __$;__ or __$-F__ The default separator for String#split.
- __$.__ The current input line number of the last file that was read.
- __$<__ An object that provides access to the concatenation of the contents of all the files given as command-line arguments, or $stdin (in the case where there are no arguments). Read only.
- __$FILENAME__ Current input file from $<. Same as $<.filename.
- __$>__ The destination of output for Kernel.print and Kernel.printf. The default value is $stdout.
- __$__ The last input line of string by gets or readline.
- __$0__ Contains the name of the script being executed. May be assignable.
- __$*__ Command line arguments given for the script. Also known as __ARGV__
- __$$__ or __Process.pid__ The process number of the Ruby running this script.
- __$?__ The status of the last executed child process.
- __$:__ or __$LOAD_PATH__  Load path for scripts and binary modules by load or require.
- __$"__ or __$LOADED_FEATURES__ or __$-I__ The array contains the module names loaded by require.
- __$stderr__ The current standard error output.
- __$stdin__ The current standard input.
- __$stdout__ The current standard output.
- __$-d__ or __$DEBUG__ The status of the -d switch. Assignable.
- __$-K__ or __$KCODE__ Character encoding of the source code.
- __$-v__ or __$VERBOSE__ The verbose flag, which is set by the -v switch.
- __$-a__ True if option -a ("autosplit" mode) is set. Read-only variable.
- __$-i__ If in-place-edit mode is set, this variable holds the extension, otherwise nil.
- __$-l__ True if option -l is set ("line-ending processing" is on). Read-only variable.
- __$-p__ True if option -p is set ("loop" mode is on). Read-only variable.
- __$-w__ True if option -w is set.

### Constants
- Constants are all uppercase with using underscores to separate words
- Constants are available within the scope of it's initialization
- Constants will raise an error if they are read before they're created
- Constants can be used outside of it's scope through the class it was instantiated
- Constants can not be defined inside of methods
- Constants are like any other variables, except that their value must remain constant for the duration of the program.
- Constants are used a lot in Rails, not so much in our projects so far

```ruby
class Ghost
  CEMETARY = "Lake View"

  def address
    CEMETARY
  end
end

# note the :: notation - more on this later
Ghost::CEMETARY
```

#### Predefined Constants

```ruby
__FILE__ # current file
__LINE__ # current line
__dir__  # current directory, breaks the damn rules
ARGV #  An array containing the command-line arguments passed to the program. A synonym for $*.
ENV # A hash-like object containing the program's environment variables. ENV can be handled as a hash.
RUBY_PLATFORM # A string indicating the platform of the Ruby interpreter.
RUBY_RELEASE_DATE # A string indicating the release date of the Ruby interpreter
RUBY_VERSION #  A string indicating the version of the Ruby interpreter.
STDERR #  Standard error output stream. Default value of $stderr.
STDIN # Standard input stream. Default value of $stdin.
STDOUT #  Standard output stream. Default value of $stdout.
```

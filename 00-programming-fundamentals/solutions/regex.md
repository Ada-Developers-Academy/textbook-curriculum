# Regex Practice Problem Solutions

## Character Sets

How could you match any alphanumeric digit like "a", "W", or "0"?

```ruby
/[0-9A-Za-z]/
```

## Wildcards and Quantifiers

Write a regular expression to match a valid email of form `name@domain.tld`

```ruby
/.+@.+\..+/
```

## Not

How can you write a regex which would accept `dog`, `sog`, and `hog`, but exclude `bog`?

```ruby
/[^b]og/
```

## Escape Characters

Write a regex for any amount of US currency, for example it should match `$3.25`, `$102.73`, and `$0.25`.

```ruby
/\$\d+\.\d\d/
```

## Start and End

Write a regex that will match only strings without any leading whitespace.

```ruby
/^\S.*/
```

## Capture Groups

Write a regular expression for these patterns:

1. An IP address like 127.0.0.1, or 206.190.36.45, Only worry about the numbers being a max of 3 digits.
    ```ruby
    /((\d){1,3}\.){3}(\d){1,3}/
    ```
1. "Ada", "Ada Academy" or "Ada Developers Academy", but not "Ada Developers" by itself. Should be case-insensitive (so both "Ada" and "ada" are OK).
    ```ruby
    /^[Aa]da(( [Dd]evelopers)? [Aa]cademy)?$/
    ```

## Search and Replace

### Phone Numbers

```ruby
phone_numbers = [
  "(206) 555-1234",
  "425-555-9999",
  "406.555.1818",
  "+1 206 555 8888",
  "4255558872",
]
phone_regex = /^.*(\d{3}).*(\d{3}).*(\d{4})$/

phone_numbers.map! do |num|
  groups = num.match(phone_regex)
  "(#{groups[1]}) #{groups[2]}-#{groups[3]}"
end

puts phone_numbers
```

### CSV to Hash

Search:
```
(DR000.),(.*),(.*),(RD00..),(.*)
```

Replace:
```
{\n  driver_id: "$1",\n  date: "$2",\n  cost: $3,\n  rider_id: "$4",\n  rating: $5\n},
```

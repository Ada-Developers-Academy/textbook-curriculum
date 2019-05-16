# Regex Practice Problem Solutions

## Character Sets

How could you match any alphanumeric digit like "a", "W", or "0"?

<details>

```ruby
/[0-9A-Za-z]/
```

</details>

## Wildcards and Quantifiers

Write a regular expression to match a valid email of form `name@domain.tld`
<details>
    
```ruby
/.+@.+\..+/
```
</details>

## Not

How can you write a regex which would accept `dog`, `sog`, and `hog`, but exclude `bog`?
<details>

```ruby
/[^b]og/
```
</details>

## Escape Characters

Write a regex for any amount of US currency, for example it should match `$3.25`, `$102.73`, and `$0.25`.

<details>

```ruby
/\$\d+\.\d\d/
```

</details>

## Start and End

Write a regex that will match only strings without any leading whitespace.

<details>

```ruby
/^\S.*/
```

</details>

## Capture Groups

Write a regular expression for these patterns:

1. An IP address like 127.0.0.1, or 206.190.36.45, Only worry about the numbers being a max of 3 digits.
   
   <details>
    
    ```ruby
    /((\d){1,3}\.){3}(\d){1,3}\
    ```
   </details>
    
1. "Ada", "Ada Academy" or "Ada Developers Academy", but not "Ada Developers" by itself. Should be case-insensitive (so both "Ada" and "ada" are OK).

   <details>
    
    ```ruby
    /^[Aa]da(( [Dd]evelopers)? [Aa]cademy)?$/ 
    ```
    
  </details>

## Search and Replace

### Phone Numbers

<details>

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
</details>

### CSV to Hash

Search:
<details>

```
(DR000.),(.*),(.*),(RD00..),(.*)
```
</details>

Replace:

<details>

```
{\n  driver_id: "$1",\n  date: "$2",\n  cost: $3,\n  rider_id: "$4",\n  rating: $5\n},
```
</details>

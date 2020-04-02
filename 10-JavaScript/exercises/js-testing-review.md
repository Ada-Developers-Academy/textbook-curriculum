# Jest Testing Review

Answer the following questions:

1.  Why is testing front-end Javascript hard? 
2.  What is the difference between the `toBe` and `toEqual` expectations?
3.  On your own paper/editor convert these tests from Ruby-Minitest to Javascript-Jest

```ruby
require_relative "test_helper"

describe "Array Intersection" do
  it "returns [4] for [2, 3, 4], and [4, 5, 6]" do
    expect(intersection([2, 3, 4], [4, 5, 6])).must_equal [4]
  end

  it "returns [] for arrays that don't intersect" do
    expect(intersection([9, 30, 42], [56, 34, 90, 32])).must_equal []
  end
end
```
4.  What purpose does the `package.json` file serve?
5.  How would you write a test to verify that a function throws an exception?

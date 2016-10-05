# Advanced Active Record Validations

## Learning Goals
- Identify areas where standard rails validators would not cover all of your validation needs
- Custom validations
- Custom validation methods

### Custom Validations

Rails provides a number of validators for you to utilize, but there may be cases where you have your own validation that you'd like to utilize.

Rails allows you to create two types of custom validators.

Custom validators are classes that you create that extend the `ActiveModel::Validator` class. This class must implement a `validate` method which will perform the validation. The result of the validation method should be an updated errors hash if the validation has not passed.

Within the model class where you would like to use the new validation, you use `validates_with` to specify the custom validator class that you want to use.

These new validator classes should be placed in the `app/validators` folder so that Rails can load them automatically for your use.

```ruby
TODO EXAMPLE
```

### Custom methods
Custom validation methods are different than custom validators because they exist within the model class itself. The result of the validation method should be an updated errors hash if the validation has not passed (same as the custom validator class).

Within the model class you use `validates` to specify the custom validation method that you want to use.

Since these custom methods exist within the model class itself, there is no additional work that needs to be done to integrate the custom methods with the model.

```ruby
TODO EXAMPLE
```

### Conditional Validations
TODO

## Resources
[Custom Validations](http://guides.rubyonrails.org/active_record_validations.html#performing-custom-validations)

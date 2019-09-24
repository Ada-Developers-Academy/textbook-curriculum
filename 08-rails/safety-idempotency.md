# Safety and Idempotency

## Learning Goals

- Define _safe_, _destructive_, and _idempotent_
- Describe which HTTP verbs are idempotent and safe

## Vocabulary

Here we introduce three new terms, all from the world of functional programming: _safe_, _destructive_, and _idempotent_. All of these terms are used to describe _operations_. An example of performing an operation is calling a method, another example is making a HTTP request.

### Safe and Destructive

We'll start with _safe_ and _destructive_. The meanings of these in the context of programming is a little different than their English meaning. An operation that is _safe_ does not change the data it operates upon. _Destructive_ is the opposite of _safe_: a destructive operation changes the data it touches.

We've seen this concept before in the context of enumerables. We know that _safe_ methods like `select` and `map` also have a _destructive_ version (`select!` and `map!`), which changes the original array instead of making a copy.

```ruby
student_names = ['ada', 'katherine', 'grace', 'anita']

# safe
lengths = student_names.map do |name|
  name.length
end
puts student_names
# => ['ada', 'katherine', 'grace', 'anita']
# original data is intact

# destructive
student_names.map! do |name|
  name.length
end
puts student_names
# => [3, 9, 5, 5]
# original data is overwritten
```

We can also use _safe_ and _destructive_ to describe our HTTP requests. However, the data the request operates on is a little different - in this case it's all the data stored by our application. Any operation that changes the database is _destructive_, and any that does not change it is _safe_.

**Question:** Which HTTP verbs are used for _safe_ operations? Which ones are _destructive_?

<details>
<summary>Answer</summary>

Only `GET` would be considered safe, as `PATCH`, `PUT`, `POST` and `DELETE` all modify data.

In other words, any `GET` request should be a _query_, whereas all other verbs will be _commands_.
</details>

### Idempotent

_Idempotent_ is another word we can use to describe an operation, but the meaning is a little more subtle than that of _safe_. When we say an operation is _idempotent_, that means that running the operation more than once on the same data will produce the same result.

For example, multiplying something by zero is an idempotent operation. The first time you do it there's a change (the number goes to 0), but if you keep multiplying by 0 you just get more 0.

If you're into etymology, idempotent is comprised of the latin roots _idem_, meaning same, and _potent_, meaning power. The idea is that the "power" of the operation is the same even if you do it more than once. The opposite of idempotent is _non-idempotent_.

**Question:** Which HTTP verbs are _idempotent_ operations?

**Question:** How are safety and idempotency related?

## Summary

**Safe**: The request can be made without resulting in data modification.

**Destructive**: The request changes the data stored on the server.

**Idempotent**: Making the same request multiple times will result in the same behavior.

Any operation that is safe is automatically idempotent, but the opposite is not always true.

| HTTP Verb | CRUD Action | Safe | Idempotent |
|-----------|-------------|------|------------|
| `GET`     | Read        | ✅  | ✅        |
| `POST`    | Create      | ❌   | ❌         |
| `PATCH` or `PUT` | Update | ❌ | ✅        |
| `DELETE`  | Delete      | ❌   | ✅        |

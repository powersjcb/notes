# w3d4: JoinsDemo

This app introduces you to all the major concepts of associations,
validations, includes, and joins.

* First check out `db/schema.rb` to see the decomposition of the
  problem: `User`s make `Post`s, and leave `Comment`s on existing
  `Post`s.
* `app/models/comment.rb` has notes on how associations are used to
  generate SQL queries.
* `app/models/user.rb` has an example and explanation of a `has_many
  :through` relation.
* `User` also demonstrates various ways to make a query using N+1
  SELECTs, an `includes` to avoid the N+1 problem, and `joins` to
  avoid fetching all the extra data that `includes` brings down.

**MAKE SURE TO UNDERSTAND THIS DEMO IN FULL**

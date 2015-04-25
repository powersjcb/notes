# Assessment Prep

**Windows users, please use one of our workstations for the
assessment.**

At App Academy, your progress will be measured by periodic
assessments. The assessments are designed to test the level of
understanding of the current material, and to ensure that you are on
track to enter the workplace at the end of the class. **If you fail
any two assessments (retakes included) you will be asked to leave the
course**.

Assessments provide you with feedback about your progress, and give
you an early indicator if you are falling behind. To get an accurate
reading, it is important that you study hard and push yourself during
the test.

**Pro-tip**: `ctrl-l` will clear the console's output, so
scrolling to the top of RSpec specs becomes faster.

## Lather, Rinse, Repeat!

Here's a general guide on how you might prepare for an assessment:

1. Run the specs for the practice assessment; make sure they run.
2. Start a timer.
3. Write solutions to the specs (in order if possible) until they are
   all passing.
4. Stop timer and evaluate your time.
5. Open and look at the solutions.
6. Close the solutions.
7. Take a break so you don't just memorize the practice
   problems. Study up on concepts that were hard. Repeat the practice.

It really helps to focus on hitting on one spec at a time. Try not to
think ahead too much. It's easy to get stuck trying to tackle all
seven specs for some method; instead you should run the tests
frequently focus only on hitting the first failing spec. Warning:
don't take this as dogma, sometimes you may have to hit specs out of
order, skip sections of the spec, or find it faster to pass multiple
specs at a time.

## Colorizing RSpec Output

You can create a `~/.rspec` file to turn colored output on by
default. Put these lines in it:

```
--color
--format documentation
```

A lot of the demos (and the assessments) should already have a
`.rspec` file already in the assessment directory, but this will apply
globally for whenever you run rspec.

## W2D1 - Assessment 1

**Pro-tip**: read the description of the failing spec, look at the
spec code, and read the error message.

**Topics**:

* Iteration
* Recursion
* Blocks and procs
* Methods
* Sorting
* Searching
* Array
* String
* Pass by reference

**Resources**:

* [Practice][a1]
* [Solutions][a1-soln]

[a1]: ./a01-practice
[a1-soln]: ./a01-practice-soln

**Retake**: W2D3 - Assessment 1 retake for those with a score less
than perfect.

## W3D1 - Assessment 2

**Note**: Assessment 2 will not test your knowledge of RSpec. It is
useful to know RSpec because that will make it easier to understand
why a spec is failing, but you will not be required to write any RSpec
tests.

**How to prepare**: This assessment is somewhat more complex than the
last and has spec broken out across files. The recommended approach is
to run each spec individually. This will give you more manageable
output. Read the instructions. The instructions will contain a
suggested order in which specs should be run.

In the assessment, we build a Blackjack game. You may review the basic
rules of Blackjack on [Wikipedia][wiki-blackjack].

[wiki-blackjack]: http://en.wikipedia.org/wiki/Blackjack

**Topics**:

* Inheritance
* Encapsulation
* Polymorphism
* Error handling, exceptions
* Decomposition

**Resources**:

* [Practice][a2]
* [Solutions][a2-soln]

[a2]: ./a02-practice
[a2-soln]: ./a02-practice-soln

**Retake**: W3D3 - Assessment 2 retake for those with a score less
than perfect.

## W4D1 - Assessment 3

Assessment 3 consists of two parts **SQL** and **ActiveRecord
Associations**.

For the SQL part: this will work exactly like SQLZoo, except that
it will be done using RSpec, rather than through the web.

The ActiveRecord part of the assessment consists of a Rails
application with models and a schema. Consulting the schema, you will
write the associations that interrelate the various model classes.

**How to prepare**: Do SQL Zoo. Do the practice assessment. Review
associations in project solutions up to this point.

**Topics**:

* SELECT
* FROM
* WHERE
* GROUP BY
* HAVING
* JOIN (left/outer, inner)
* DISTINCT
* COUNT
* SUM
* belongs_to
* has_many
* has_one
* through

**Resources**:

* [Practice at SQLZoo][sql-zoo]
* [SQL practice][a3-sql]
* [SQL solution][a3-sql-soln]
* [Associations practice][a3-assoc]
* [Associations solution][a3-assoc-soln]

## W5D2 - Assessment 4

### Preparation

Know Auth!!! Authentication, basic CRUD (Create, Read, Update, Delete)
operations in ruby on rails. Lather, rinse, repeate the practice
assessment and learn how to read the [Capybara][capybara] specs.

**Hints**:

The assessment **will** require you to use BCrypt. You may not store
passwords in the DB.

The assessment specs **will not** enforce that you protect against
CSRF attacks. You **may** comment out `protect_from_forgery` in
`ApplicationController`. My recommendation is to **not** disable CSRF
protection; you should know how to add the hidden input tag into a
form with the CSRF token. You need to know that if you neither (A)
disable CSRF protection nor (B) upload the CSRF token, then the
session is going to be reset, which will log out the user.  **This is
a common mistake**.

**Topics**:

* Authentication and Authorization, BCrypt
* Models, Associations, Validations
* Controllers
* Layouts, Helpers, Views
* Basic Error Rendering (`redirect_to` vs `render`)

**Resources**:

* [practice][a4]
* [solutions][a4-soln]

W5D5 - Assessment 4 retake

[capybara]: https://github.com/jnicklas/capybara

## W6D5 - Assessment 5

**How to prepare**: Practice running [jasmine][jasmine-github] specs
([Additional tutorial][jasmine-tutorial]).

**Topics**:

* recursion
* iteration
* callbacks
* bind, call, apply
* inheritance
* namespacing

**Resources**:

* [practice][a5]
* [solutions][a5-soln]
* [Further JS Preparation Walkthrough](./js-readme.md)

[jasmine-tutorial]: http://evanhahn.com/how-do-i-jasmine/
[jasmine-github]: https://github.com/jasmine/jasmine

## W8D1 - Assessment 6

**How to prepare**: Practice running [jasmine][jasmine-github] specs.

**Topics**:
*  myBind
*  myCall
*  myCurry
*  Backbone.Model
*  Backbone.Collection
*  Backbone.View
*  Backbone.Router

**Resources**:

* [practice][a6]
* [solutions][a6-soln]

[a3-sql]: ./a03-practice-sql
[a3-sql-soln]: ./a03-practice-sql-soln
[a3-assoc]: ./a03-practice-assoc
[a3-assoc-soln]: ./a03-practice-assoc-soln
[sql-zoo]: http://sqlzoo.net/wiki/Main_Page
[a4]: ./a04-practice
[a4-soln]: ./a04-practice-soln
[a5]: ./a05-practice
[a5-soln]: ./a05-practice-soln
[a6]: ./a06-practice
[a6-soln]: ./a06-practice-soln

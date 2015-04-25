# Blackjack

## Rules

* You have **1 hour** for the assessment. Do not worry if you do not
  complete all the assessment; finish as much as you can.
* Descriptions of each method to implement are written into the `lib/`
  files. For each `lib/` file, there is a corresponding `spec/` file.
* Run the specs as you solve the assessment. Solve the assessment in
  this order:

```
bundle exec rspec spec/deck_spec.rb
bundle exec rspec spec/hand_spec.rb
bundle exec rspec spec/player_spec.rb
bundle exec rspec spec/dealer_spec.rb
```

* Wait until you finish to run `rspec spec`, which will run all the
  tests. Do this as a final check that you have them all passing.

## Game Rules

* Players play against the dealer; multiple players can win each
  round.
* Players win if they don't "bust" and either:
    1. their hand is worth more points than the dealer's hand.
    2. the dealer busts.
* To compute a hand's value, add the value of each numbered card, and
  ten for face cards. An ace is worth 11 if the total score would be
  <= 21. If an ace value of 11 would result in a bust, it is worth 1.
* A score of >21 is a bust.
* Players are first dealt two cards; they can request additional cards
  ("hit") until they pass ("stay") or bust.
* The dealer must hit on a hand worth <17, otherwise he must stay.

class RPS
  attr_reader :computer_hand
  HANDS = [:rock, :paper, :scissors]

  def initialize
    @computer_hand = HANDS.shuffle[0]
  end

  def valid?(string)
    HANDS.include?(string)
  end

  def determine_winner(hand, computer_hand)
    if  (hand == :paper     && computer_hand == :rock) ||
          (hand == :scissors  && computer_hand == :paper) ||
          (hand == :rock      && computer_hand == :scissors)
      puts "You win!"
    elsif hand == computer_hand
      puts "You tie!"
    else
      puts "You lose!"
    end
  end

  def play(hand)
    hand = hand.to_sym
    if valid?(hand)
      puts "You played #{hand}, and the computer played #{computer_hand}."
      determine_winner(hand, computer_hand)
    else
      puts "That is not a valid hand"
    end
  end
end

game = RPS.new
game.play("rock")

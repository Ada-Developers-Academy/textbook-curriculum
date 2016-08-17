# BlackjackSample.rb

module Blackjack
    MAX_SCORE = 21
    module Player
        MAX_PLAYERS = 2
        class Player
          def initialize
          end
        end
    end
    module Card
        MAX_VALUE = 13
        class Card
          def get_max_value()
              return MAX_VALUE
          end
        end
    end

end

MAX_SCORE = 50
MAX_PLAYERS = 4
MAX_VALUE = 21

puts "MAX_SCORE - #{MAX_SCORE}"
puts "Blackjack::MAX_SCORE - #{Blackjack::MAX_SCORE}"

puts

puts "MAX_Players - #{MAX_PLAYERS}"
puts "Blackjack::Player::MAX_Players - #{Blackjack::Player::MAX_PLAYERS}"

puts

puts "MAX_VALUE - #{MAX_VALUE}"
puts "Blackjack::Card::get_max_value -  #{Blackjack::Card::Card.new().get_max_value()}"

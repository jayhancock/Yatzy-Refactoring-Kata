require_relative 'yatzy'
require 'test/unit'

class YatzyTest < Test::Unit::TestCase
  TEST_DATA = [
    [:chance, [2,3,4,5,1], 15],
    [:chance, [3,3,4,5,1], 16],
    [:yatzy,  [1,1,1,1,1], 50],
    [:yatzy,  [2,2,2,2,2], 50],
    [:yatzy,  [3,3,3,3,3], 50],
    [:yatzy,  [4,4,4,4,4], 50],
    [:yatzy,  [5,5,5,5,5], 50],
    [:yatzy,  [6,6,6,6,6], 50],
    [:yatzy,  [6,6,6,6,1], 0],
    [:ones,   [1,2,3,4,5], 1],
    [:ones,   [1,2,1,4,5], 2],
    [:ones,   [1,2,1,1,1], 4],
    [:ones,   [2,2,3,4,5], 0],
    [:twos,   [1,2,3,4,5], 2],
    [:twos,   [1,2,3,2,5], 4],
    [:twos,   [2,2,3,2,2], 8],
    [:twos,   [1,1,3,4,5], 0],
    [:threes, [1,2,3,4,5], 3],
    [:threes, [1,2,3,4,3], 6],
    [:threes, [3,3,1,3,3], 12],
    [:threes, [1,2,2,4,5], 0],
    [:fours,  [1,2,3,4,5], 4],
    [:fours,  [1,4,3,4,5], 8],
    [:fours,  [4,4,3,4,4], 16],
    [:fours,  [1,2,3,3,5], 0],
    [:fives,  [1,2,3,4,5], 5],
    [:fives,  [1,2,5,4,5], 10],
    [:fives,  [5,5,5,4,5], 20],
    [:fives,  [1,2,3,4,1], 0],
    [:sixes,  [1,2,3,4,6], 6],
    [:sixes,  [1,2,6,4,6], 12],
    [:sixes,  [6,6,3,6,6], 24],
    [:sixes,  [1,2,3,4,5], 0],
    [:one_pair, [3,4,3,5,6], 6],
    [:one_pair, [5,3,3,3,5], 10],
    [:one_pair, [5,3,6,6,5], 12],
    [:one_pair, [1,2,3,4,5], 0],
    [:two_pair, [3,3,5,4,5], 16],
    [:two_pair, [3,3,5,5,5], 16],
    [:two_pair, [3,3,4,5,6], 0],
    [:three_of_a_kind, [3,3,3,4,5], 9],
    [:three_of_a_kind, [3,3,3,3,5], 9],
    [:three_of_a_kind, [5,3,5,4,5], 15],
    [:three_of_a_kind, [1,3,5,4,5], 0],
    [:four_of_a_kind, [3,3,3,3,5], 12],
    [:four_of_a_kind, [5,5,5,4,5], 20],
    [:four_of_a_kind, [3,3,3,3,3], 12],
    [:four_of_a_kind, [3,3,3,3,3], 12],
    [:four_of_a_kind, [3,3,3,4,5], 0],
    [:small_straight, [1,2,3,4,5], 15],
    [:small_straight, [2,3,4,5,1], 15],
    [:small_straight, [1,2,2,4,5], 0],
    [:small_straight, [2,3,4,5,6], 0],
    [:large_straight, [6,2,3,4,5], 20],
    [:large_straight, [2,3,4,5,6], 20],
    [:large_straight, [1,2,3,4,5], 0],
    [:large_straight, [1,2,2,4,5], 0],
    [:full_house, [6,2,2,2,6], 18],
    [:full_house, [2,3,4,5,6], 0]
  ]

  TEST_DATA.each do |method, dice, expected|
    define_method("test_#{method}_#{dice.join}_#{expected}") do
      assert Yatzy.send(method, *dice) == expected
    end
  end
end

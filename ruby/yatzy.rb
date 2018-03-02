class Yatzy
  def self.chance(*dice)
    dice.reduce(0, :+)
  end

  def self.yatzy(*dice)
    dice.uniq.length == 1 ? 50 : 0
  end

  def self.ones(*dice)
    sames(1, *dice)
  end

  def self.twos(*dice)
    sames(2, *dice)
  end

  def self.threes(*dice)
    sames(3, *dice)
  end

  def self.fours(*dice)
    sames(4, *dice)
  end

  def self.fives(*dice)
    sames(5, *dice)
  end

  def self.sixes(*dice)
    sames(6, *dice)
  end

  def self.score_pair(*dice)
    n_of_a_kind(2, *dice)
  end

  def self.two_pair(*dice)
    pairs = find_pairs(*dice)
    pairs.length == 2 ? pairs.reduce(0, :+) * 2 : 0
  end

  def self.four_of_a_kind(*dice)
    n_of_a_kind(4, *dice)
  end

  def self.three_of_a_kind(*dice)
    n_of_a_kind(3, *dice)
  end

  def self.smallStraight(*dice)
    straight = find_straight(*dice)

    straight.first == 1 ? 15 : 0
  end

  def self.largeStraight( d1,  d2,  d3,  d4,  d5)
    tallies = [0]*6
    tallies[d1-1] += 1
    tallies[d2-1] += 1
    tallies[d3-1] += 1
    tallies[d4-1] += 1
    tallies[d5-1] += 1
    if (tallies[1] == 1 and tallies[2] == 1 and tallies[3] == 1 and tallies[4] == 1 and tallies[5] == 1)
      return 20
    end
    return 0
  end

  def self.full_house(*dice)
    threes = find_groups(3, *dice)
    pairs = find_groups(2, *dice) - threes

    return 0 unless pairs.length == 1 && threes.length == 1

    pairs.first * 2 + threes.first * 3
  end

  private

  def self.sames(number, *dice)
    dice.select {|d| d == number}.reduce(0, :+)
  end

  def self.n_of_a_kind(number, *dice)
    highest = find_groups(number, *dice).sort.last

    (highest || 0) * number
  end

  def self.find_pairs(*dice)
    find_groups(2, *dice)
  end

  def self.find_groups(group_size, *dice)
    (1..6).select { |i| dice.count(i) >= group_size }
  end

  def self.find_straight(*dice)
    sorted = dice.sort

    differences = successive_differences(*sorted)
    differences.uniq.length == 1 && differences.first == 1 ? sorted : []
  end

  def self.successive_differences(*dice)
    dice[1..-1].zip(dice[0..-2]).map { |pair| pair.first - pair.last }
  end
end

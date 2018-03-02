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
    highest = find_pairs(*dice).sort.last

    (highest || 0) * 2
  end

  def self.two_pair(*dice)
    pairs = find_pairs(*dice)
    pairs.length == 2 ? pairs.reduce(0, :+) * 2 : 0
  end

  def self.four_of_a_kind( _1,  _2,  d3,  d4,  d5)
    tallies = [0]*6
    tallies[_1-1] += 1
    tallies[_2-1] += 1
    tallies[d3-1] += 1
    tallies[d4-1] += 1
    tallies[d5-1] += 1
    for i in (0..6)
      if (tallies[i] >= 4)
        return (i+1) * 4
      end
    end
    return 0
  end

  def self.three_of_a_kind(*dice)
    highest = find_three_of_a_kinds(*dice).sort.last

    (highest || 0) * 3
  end

  def self.smallStraight( d1,  d2,  d3,  d4,  d5)
    tallies = [0]*6
    tallies[d1-1] += 1
    tallies[d2-1] += 1
    tallies[d3-1] += 1
    tallies[d4-1] += 1
    tallies[d5-1] += 1
    (tallies[0] == 1 and
      tallies[1] == 1 and
      tallies[2] == 1 and
      tallies[3] == 1 and
      tallies[4] == 1) ? 15 : 0
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

  def self.fullHouse( d1,  d2,  d3,  d4,  d5)
    tallies = []
    _2 = false
    i = 0
    _2_at = 0
    _3 = false
    _3_at = 0

    tallies = [0]*6
    tallies[d1-1] += 1
    tallies[d2-1] += 1
    tallies[d3-1] += 1
    tallies[d4-1] += 1
    tallies[d5-1] += 1

    for i in Array 0..5
      if (tallies[i] == 2)
        _2 = true
        _2_at = i+1
      end
    end

    for i in Array 0..5
      if (tallies[i] == 3)
        _3 = true
        _3_at = i+1
      end
    end

    if (_2 and _3)
      return _2_at * 2 + _3_at * 3
    else
      return 0
    end
  end

  private

  def self.sames(number, *dice)
    dice.select {|d| d == number}.reduce(0, :+)
  end

  def self.find_pairs(*dice)
    find_groups(2, *dice)
  end

  def self.find_three_of_a_kinds(*dice)
    find_groups(3, *dice)
  end

  def self.find_groups(group_size, *dice)
    (1..6).select { |i| dice.count(i) >= group_size }
  end
end

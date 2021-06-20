require "byebug"

class Code
  POSSIBLE_PEGS = {
    "R" => :red,
    "G" => :green,
    "B" => :blue,
    "Y" => :yellow
  }

  attr_reader :pegs
  ARR = []
  def self.valid_pegs?(chars)
    chars.all? {|char| POSSIBLE_PEGS.has_key?(char.upcase)}
  end

  def initialize(arr)
    if Code.valid_pegs?(arr) 
      true
      @pegs = []
      arr.each {|char| @pegs << char.upcase}
    else
      error
    end
  end

  def self.random(num)
    random = []
    num.times { random << POSSIBLE_PEGS.keys.sample }
    Code.new(random)
  end

  def self.from_string(str)
    Code.new(str.split(""))
  end

  def [](idx)
    pegs[idx]
  end

  def length 
    pegs.length
  end

  def num_exact_matches(guess)
    count = 0
    guess.pegs.each.with_index do |char, i| 
      if pegs.include?(char) && i == pegs.index(char)
         count += 1
         ARR << char 
      end
    end
    count 
  end

  def num_near_matches(guess)
    count = 0
    (0...guess.length).each do |i|
      if self.pegs.include?(guess[i]) && guess[i] != self[i] 
        count += 1
      end
    end
    count
  end

  def ==(guess)
    self.pegs == guess.pegs
  end
end 

require_relative 'permutations'

input = ARGV[0]

words = Hash.new { |h,k| h[k] = [] }
File.open('/usr/share/dict/words').map do |word|
  length = word.strip.length
  next if length == 1
  words[word.strip.length] << word.strip.downcase
end

words[1] = ['a', 'i']

numbers = {
            "2" => ["a", "b", "c"],
            "3" => ["d", "e", "f"],
            "4" => ["g", "h", "i"],
            "5" => ["j", "k", "l"],
            "6" => ["m", "n", "o"],
            "7" => ["p", "q", "r", "s"],
            "8" => ["t", "u", "v"],
            "9" => ["w", "x", "y", "z"]
          }

splits(input).each do |split|
  groups = split.map do |number|
    poss = number.split('').map do |n|
      numbers[n]
    end
    if poss.any? {|p| p.nil? }
      [number]
    else
      valids = permutations(poss).map(&:join).select do |w|
        words[w.length].include?(w)
      end
      valids.empty? ? [number] : valids
    end
  end
  # p groups
  permutations(groups).each do |foo|
    puts foo.join(' ').upcase
  end
end

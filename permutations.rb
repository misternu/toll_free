def permutations(poss)
  # return poss[0].map { |p| [p] } if poss.length == 1
  # poss.last.map do |i|
  #   permutations(poss[0...-1]).map do |j|
  #     j.dup.push(i)
  #   end
  # end .flatten(1)
  return poss[0].map do |p| [p] end unless poss.length > 1
  poss.inject(&:product).map(&:flatten)
end

def splits(string)
  # return [[string]] if string.length == 1
  # splits(string[1..-1]).map do |i|
  #   cut = i.dup
  #   cut.unshift(string[0])
  #   dont = i.dup
  #   dont[0] = string[0] + dont[0]
  #   [cut, dont]
  # end .flatten(1)
  first = [[string[0]]] # Array of array of first character
  string[1..-1].split('').inject(first) do |memo, char|
    cut = memo.map { |m| m + [char] }
    dont = memo.map { |m| m[0...-1] + [m[-1] + char] }
    cut + dont
  end
end

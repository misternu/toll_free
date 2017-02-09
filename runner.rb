input = ARGV[0]

words = File.open('/usr/share/dict/words').map do |word|
  word.strip
end


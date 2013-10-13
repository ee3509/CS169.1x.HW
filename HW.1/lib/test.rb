input = "scream cars for four scar creams"
input.downcase!
words = input.split
hash = Hash.new

words.each do |word|
  key=0
  word.each_char do |c| key+=c.ord end
  if hash.has_key?(key) then hash[key] << word
  else 
    hash[key] = [word]
  end  
end

puts hash.values

#"hello".each_char do |c| puts c.ord end

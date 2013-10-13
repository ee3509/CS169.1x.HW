module FunWithStrings
  def palindrome?
    self.gsub! /\W/,""
    self.downcase.reverse == self.downcase   
  end
  
  def count_words
    self.downcase!
    
    res = Hash.new
    self.split.each do |entry| 
      entry.gsub! /\W/ , ""  #remove non word chars from the has key which is a word
      if res.has_key?(entry)
        res[entry]+=1
      else if entry!=""
        res[entry] = 1
      end
      end
    end
    return res
    end


  def anagram_groups
    input = self    
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
    
    hash.values
    
  end
end

# make all the above functions available as instance methods on Strings:

class String
  include FunWithStrings
end


def sum(input)
  res =0
  input.each {|element| res+= element}
  res # returns this automatically 
end


# puts "sum [1,2,3,4] == 10"
# puts sum [1,2,3,4]
# 
# puts "sum [] == 0"
# puts sum []


def max_2_sum(input)
  input.sort!.reverse!
  if input.length > 1 
    return input[0]+input[1]
  else 
    if input.length == 0 
      return 0
    end
    return input[0]
  end
end

# puts "max_2_sum([1,2,4,3]) == 7"
# print max_2_sum([1,2,4,3])
# puts
# 
# puts "max_2_sum [2] == 2" 
# print max_2_sum [2]
# puts
# 
# puts "max_2_sum[] == 0"
# print max_2_sum []


def sum_to_n?(input,target)
  
  # check if we have [],0 which would be true since an empty array sums to 0
  if(input.length == 0 and target ==0 )
    return true
  end
  
  # for each element check if we have the target-element and return true
  input.each {|elem| 
    if(input.include? target-elem)
       return true
    end
    }
  return false
end


# puts "sum_to_n? [1,2,3,4,5,6], 7 == true"
# puts sum_to_n?([1,2,3,4,5,6],7)
# 
# puts "sum_to_n? [1,2,3,4,5,6], 56 == false"
# puts sum_to_n?([1,2,3,4,5,6],56)
# 
# puts "sum_to_n? [], 2 == false"
# puts sum_to_n? [], 2
# 
# puts "sum_to_n? [], 0 == true"
# puts sum_to_n? [], 0







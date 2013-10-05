def hello(name)
  "Hello, " + name
end

# puts "hello panos == Hello, panos"
# puts hello "panos"

def starts_with_consonant?(s)
  
  if (s.length==0)
    return false
  end
  
  if( (s =~ /^[aeiouAEIOU0-9\W]/) != nil )
  return false
  end
  return true
end

# puts "starts_with_consonant? railroad == true"
# puts starts_with_consonant? "railroad"
# 
# puts "starts_with_consonant? Railroad == true"
# puts starts_with_consonant? "Railroad"
# 
# puts "starts_with_consonant? oscar == false"
# puts starts_with_consonant? "oscar"
# 
# puts "starts_with_consonant? Oscar == false"
# puts starts_with_consonant? "oscar"
# 
# puts "starts_with_consonant? 123 == false"
# puts starts_with_consonant? "123"
# 
# puts "starts_with_consonant? 0123 == false"
# puts starts_with_consonant? "0123"
# 
# puts "starts_with_consonant? ' 123' == false"
# puts starts_with_consonant? " 123"
# 
# puts "starts_with_consonant? $15 == false"
# puts starts_with_consonant? "#15"
# 
# puts "starts_with_consonant? '' == false"
# puts starts_with_consonant? ""

def binary_multiple_of_4?(byte)

  if(byte.length ==0 or byte.to_i == 0)
    return false
  end
  
  
  
  # make sure we have a valid binary
  if( (byte =~ /[^01]/) != nil)
    return false
  end
  # check if we can divide by 4
  if(byte.to_i % 0b100 != 0) 
    return false
  end
  return true
end

# puts "binary_multiple_of_4? 1000==true"
# puts binary_multiple_of_4? "1000"
# 
# puts "binary_multiple_of_4? 0100==true"
# puts binary_multiple_of_4? "0100"
# 
# puts "binary_multiple_of_4? 0010==false"
# puts binary_multiple_of_4? "0010"
# 
# puts "binary_multiple_of_4? 1100==true"
# puts binary_multiple_of_4? "1100"
# 
# puts "binary_multiple_of_4? 1101==false"
# puts binary_multiple_of_4? "1101"
# 
# puts "binary_multiple_of_4? 242==false"
# puts binary_multiple_of_4? "242"
# 
# puts "binary_multiple_of_4? ''==false"
# puts binary_multiple_of_4? ""
# 
# puts "binary_multiple_of_4? 0==false"
# puts binary_multiple_of_4? "0"


class Class
  def attr_accessor_with_history(attr_name)
    attr_name = attr_name.to_s # make sure it's a string
    attr_reader attr_name # create the attribute's getter
    attr_reader attr_name+"_history" # create bar_history getter
  
      
      class_eval %Q{
            def #{attr_name}=(value)
                 
                if !defined? @#{attr_name}_history
                    @#{attr_name}_history = []
                    @last = nil
                end
                
                @#{attr_name}_history << @last
                
                @#{attr_name}_history << value
                @#{attr_name} = value
                
                @last =  @#{attr_name}_history.pop 
                
            end
      }
    
  end
end



class Foo
  attr_accessor_with_history :bar
  
  
  
end

# f = Foo.new
# g = Foo.new
# f.bar = :a
# f.bar = :b
# f.bar = :c
# 
# g.bar = :d
# 
# 
# puts f.bar_history
# puts g.bar_history
# 
# # f.myvar = 1
# # f.myvar = 3
# # f.myvar_history

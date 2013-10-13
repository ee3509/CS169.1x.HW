class Dessert
  attr_accessor :name, :calories
  
  def initialize(name, calories)
    @name = name
  end
  def healthy?
    @calories < 200
  end
  def delicious?
    # your code here
  end
end

class JellyBean < Dessert
  attr_accessor :flavor
  def initialize(flavor)
    @flavor = flavor
  end
end

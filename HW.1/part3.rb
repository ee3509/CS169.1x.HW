class BookInStock
  attr_accessor :isbn, :price
  
  def initialize(isbn,price)
    
    raise ArgumentError, "Invalid ISBN" if(isbn.length<1 or price.to_i<1)
    # raise ArgumentError, "Invalid Price" if(price.length<1)  
    # raise ArgumentError, "Invalid Price" if(price.to_i<1)  

    @isbn=isbn
    @price=price
  end
  
  def price_as_string
    "$%.2f" % @price
  end
  
end

book = BookInStock.new("2323213","25.40")
book.isbn=12312312
print book.price_as_string

# book.price_as_string

# On Time 
# BookInStock
  # should be defined
  # getters and setters
    # should set ISBN [10 points] (FAILED)
    # should set price [10 points] (FAILED)
    # should be able to change ISBN [10 points] (FAILED)
    # should be able to change price [10 points] (FAILED)
  # constructor
    # should reject invalid ISBN number [10 points] (FAILED)
    # should reject zero price [10 points] (FAILED)
    # should reject negative price [10 points] (FAILED)
  # #price_as_string
    # should be defined (FAILED)
    # should display 33.95 as "$33.95" [10 points] (FAILED)
    # should display 1.1 as $1.10 [10 points] (FAILED)
    # should display 20 as $20.00 [10 points] (FAILED)


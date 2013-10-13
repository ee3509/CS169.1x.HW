class BookInStock
  attr_accessor :isbn, :price
  
  def initialize(isbn,price)
    
    raise ArgumentError, "Invalid ISBN" if(isbn.length<1 or price.to_i<1)

    @isbn=isbn
    @price=price
  end
  
  def price_as_string
    "$%.2f" % @price
  end
  
end

# book = BookInStock.new("2323213","25.40")
# book.isbn=12312312
# print book.price_as_string

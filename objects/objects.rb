class Product
  attr_reader :name, :price, :weigth
  attr_writer :name, :price, :weigth
  # attr_accessor me da permisos de lectura y escritura sobre la variable llamada
  def initialize(opts = {})
    @name = opts[:name] ? opts[:name] : "NN"
    @price = opts[:price] ? opts[:price] : 0
    @weigth = opts[:weigth] ? opts[:weigth] : 0
  end
end

product = Product.new({name: "potato", price: 300})
puts product
puts product.class
puts product.name
puts product.price
puts product.weigth

product2 = Product.new
puts product2
puts product2.class
puts product2.name
puts product2.price

product3 = Product.new
puts product3
puts product3.class
puts product3.name
puts product3.price

require 'csv'

Product.delete_all
Category.delete_all

filename = Rails.root.join('db/products.csv')

puts "Loading source csv from: #{filename}"

csv_data = File.read(filename)
products = CSV.parse(csv_data, headers: true, encoding: 'utf-8')

products.each do |p|
  product_category = Category.find_or_create_by(name: p['category'])
  if product_category&.valid?
    product = product_category.products.create(
      title: p['name'],
      price: p['price'],
      description: p['description'],
      stock_quantity: p['stock quantity']
    )
  else
    puts "Invalid product category: #{product_category} for the product #{p['name']}."
  end
end
puts "Created #{Category.count} product categories"
puts "Created #{Product.count} products"

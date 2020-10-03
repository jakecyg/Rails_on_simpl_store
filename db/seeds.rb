require 'csv'

Product.delete_all

676.times  do
  new_prod = Product.find_or_create_by(title: Faker::Commerce.unique.product_name,
                                       price: Faker::Commerce.price,
                                       stock_quantity: Faker::Number.between(from: 1, to: 1000))
  if(new_prod.valid?)
    new_prod.save
  end
end
puts "Created #{Product.count} new products."

# movies.each do |m|
#   production_company = ProductionCompany.find_or_create_by(name: m['production_company'])

#   if production_company&.valid?
#     movie = production_company.movies.create(
#       title: m['original_title'],
#       year: m['year'],
#       duration: m['duration'],
#       description: m['description'],
#       average_vote: m['avg_vote']
#     )
#   else
#     puts "Invalid production company: #{production_company} for the movie #{m['original_title']}."
#   end
# end

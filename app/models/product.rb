class Product < ApplicationRecord
  valiates :title, :price, :stock_quantity, presence: true
end

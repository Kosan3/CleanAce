FactoryBot.define do
  factory :product_detail do
    non_taxed_price { 500 }
    product
    product_color
    product_size
  end
end
FactoryBot.define do
  factory :cart do
    quantity { 1 }
    user
    product_detail
  end
end
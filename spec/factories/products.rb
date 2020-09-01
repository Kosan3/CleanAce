FactoryBot.define do
  factory :product do
    product_name { 'テストネーム' }
    introduction { 'テスト説明' }
    image_id { 'image_id' }
  end
end
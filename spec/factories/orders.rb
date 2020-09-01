FactoryBot.define do
  factory :order do
    fare { 800 }
    billing_total { 1000 }
    payment_method { 0 }
    postal_code { 1111111 }
    address { '千葉県幕張市浦安1-1' }
    address_name { 'テスト太郎' }
    user
  end
end
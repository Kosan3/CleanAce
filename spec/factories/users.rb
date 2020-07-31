FactoryBot.define do
  factory :user do
    last_name {'テスト_姓'}
    first_name {'テスト_名'}
    kana_last_name {'テストセイ'}
    kana_first_name {'テストメイ'}
    email {'example@com'}
    password {'password'}
    postal_code {'1111111'}
    address {'千葉県浦安市舞浜1-1'}
    phone_number {'09012341234'}
    admin {false}
  end
end
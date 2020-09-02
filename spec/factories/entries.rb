FactoryBot.define do
  factory :entry do
    last_name {'テスト_姓'}
    first_name {'テスト_名'}
    kana_last_name {'テストセイ'}
    kana_first_name {'テストメイ'}
    age {23}
    email {'example@power.com'}
    postal_code {'1111111'}
    address {'千葉県浦安市舞浜1-1'}
    phone_number {'09012341234'}
  end
end
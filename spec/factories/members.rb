FactoryBot.define do
  factory :member do
    name { '山田 太郎' }
    en_name { 'TARO YAMADA' }
    position { '投手' }
    introduction { 'テストテストテスト' }
    uniform_number { 19 }
  end
end

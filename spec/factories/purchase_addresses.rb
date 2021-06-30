FactoryBot.define do
  factory :purchase_address do
    postal_code { '123-4567' }
    prefecture_id { 1 }
    city { '東京都' }
    address { '1-1' }
    building { '東京ハイツ' }
    tel { '1234567890' }
    purchase_id {1}
  end
end

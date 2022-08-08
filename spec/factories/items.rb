FactoryBot.define do
  factory :item do
    item_name                   { Faker::Lorem.characters(number: 10) }
    description                 { Faker::Lorem.sentence(word_count: 3) }
    category_id                 { Faker::Number.between(from: 2, to: 11) }
    status_id                   { Faker::Number.between(from: 2, to: 7) }
    delivery_change_id          { Faker::Number.between(from: 2, to: 3) }
    delivery_time_id            { Faker::Number.between(from: 2, to: 4) }
    prefecture_id               { Faker::Number.between(from: 2, to: 48) }
    price                       { Faker::Number.between(from: 300, to: 9_999_999) }

    association :user

    after(:build) do |item|
      item.image.attach(io: File.open('app/assets/images/item-sample.png'), filename: 'item-sample.png')
    end
    
  end
end

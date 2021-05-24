FactoryBot.define do
  factory :item do
    item_name                   { Faker::Movie.title }
    description                 { Faker::Quote.famous_last_words }
    category_id                 { Faker::Number.between(from: 2, to: 11) }
    status_id                   { Faker::Number.between(from: 2, to: 7) }
    delivery_change_id          { Faker::Number.between(from: 2, to: 3) }
    delivery_time_id            { Faker::Number.between(from: 2, to: 4) }
    prefecture_id               { Faker::Number.between(from: 2, to: 48) }
    price                       { Faker::Number.between(from: 300, to: 9999999) }
   
    association :user
  
    after(:build) do |item|
      item.image.attach(io: File.open('app/assets/images/item-sample.png'), filename: 'item-sample.png')
    end
  end
end

require 'faker'

FactoryGirl.define do

  factory :product do |f|
    f.name { Faker::Commerce.product_name }
    f.description { Faker::Lorem.sentence(3, true) }
    f.price { Faker::Commerce.price }
  end

  factory :invalid_product, parent: :product do |f|
    f.name nil
  end

end
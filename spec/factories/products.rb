FactoryBot.define do
  factory :product do
    name { Faker::Commerce.product_name }
    stock { rand(5..20) }
    price { Faker::Commerce.price }
  end
end

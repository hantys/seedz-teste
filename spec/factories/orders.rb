FactoryBot.define do
  factory :order do
    user { create(:user) }
    product { create(:product) }
    amount { 2 }
  end
end

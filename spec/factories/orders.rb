FactoryBot.define do
  factory :order do
    user_id { create(:user).id }
    product_id { create(:product).id }
    amount { 2 }
  end
end

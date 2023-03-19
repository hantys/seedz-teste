require 'rails_helper'

RSpec.describe Product, type: :model do
  context 'Creation' do
    it 'save product' do
      product = build(:product)
      expect(product.save).to equal(true)
    end

    it 'created product' do
      expect { create(:product) }.to change(Product, :count).by(1)
    end

    it 'not created product' do
      product = build(:product, name: nil)
      expect { product.save! }.to raise_error(ActiveRecord::RecordInvalid)
    end
  end

  context 'Validates' do
    it { is_expected.to validate_presence_of(:price) }
    it { is_expected.to validate_presence_of(:stock) }
    it { is_expected.to validate_presence_of(:name) }
    it { is_expected.to validate_numericality_of(:price).is_greater_than(0) }
  end

  # context 'Associations' do
  # end

  # context 'Instance Methods' do
  # end

  # context 'Others' do
  # end
end

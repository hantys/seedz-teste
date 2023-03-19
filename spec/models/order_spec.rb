require 'rails_helper'

RSpec.describe Order, type: :model do
  context 'Creation' do
    it 'save order' do
      order = build(:order)
      expect(order.save).to equal(true)
    end

    it 'created order' do
      expect { create(:order) }.to change(Order, :count).by(1)
    end

    it 'not created order' do
      order = build(:order, amount: 0)
      expect { order.save! }.to raise_error(ActiveRecord::RecordInvalid)
    end
    it 'not created order if not product' do
      order = build(:order, product: nil)
      expect { order.save! }.to raise_error(ActiveRecord::RecordInvalid)
    end
  end

  context 'Validates' do
    it { is_expected.to validate_presence_of(:total) }
    it { is_expected.to validate_presence_of(:amount) }
    it { is_expected.to validate_numericality_of(:total).is_greater_than(0) }
    it { is_expected.to validate_numericality_of(:amount).is_greater_than(0) }
    it 'verify_stock is work' do
      order = build(:order, amount: 500)
      order.valid?
      expect(order.errors[:amount]).to include('não pode ser maior que o estoque')
    end
  end

  context 'Associations' do
    subject { build(:order, user: create(:user), product: create(:product)) }

    it { is_expected.to belong_to(:user) }
    it { is_expected.to belong_to(:product) }
  end

  context 'Instance Methods' do
    it 'remove_stock' do
      product = create(:product, stock: 2)
      create(:order, product: product, amount: 2)
      product.reload
      expect(product.stock).to eq(0)
    end

    it 'calc_total' do
      product = create(:product, price: 10)
      order = create(:order, product: product, amount: 2)

      expect(order.total).to eq(20)
      expect(order.total).to eq(product.price * order.amount)
    end
  end

  # context 'Others' do
  # end
end

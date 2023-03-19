require 'rails_helper'

RSpec.describe User, type: :model do
  context 'Creation' do
    it 'save user' do
      user = build(:user)
      expect(user.save).to equal(true)
    end

    it 'created user' do
      expect { create(:user) }.to change(User, :count).by(1)
    end

    it 'not created user' do
      user = build(:user, email: '')
      expect { user.save! }.to raise_error(ActiveRecord::RecordInvalid)
    end
  end

  context 'Validates' do
    it { is_expected.to validate_presence_of(:email) }
    it { is_expected.to validate_presence_of(:password) }
    it { is_expected.to validate_presence_of(:name) }
  end

  # context 'Associations' do
  # end

  # context 'Instance Methods' do
  # end

  # context 'Others' do
  # end
end

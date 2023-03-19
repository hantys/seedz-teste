class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :name, presence: true

  before_create :generate_token

  def generate_token
    self.token = (Digest::SHA1.hexdigest(SecureRandom.uuid)[0..7]).downcase
    generate_token if User.exists?(token: token)
  end
end

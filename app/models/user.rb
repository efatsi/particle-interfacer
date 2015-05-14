class User < ActiveRecord::Base
  devise :database_authenticatable, :rememberable, :validatable

  has_many :cores,
    dependent:  :destroy,
    inverse_of: :user
  accepts_nested_attributes_for :cores, reject_if: :all_blank

  validates :access_token, presence: true
end

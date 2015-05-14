class Core < ActiveRecord::Base
  belongs_to :user

  validates :user, :name, :core_id, presence: true
end

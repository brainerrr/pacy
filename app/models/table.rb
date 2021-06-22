class Table < ApplicationRecord
  validates :number, presence: true
  belongs_to :restaurant
  has_many :baskets, dependent: :destroy
  has_many :users, through: :baskets
end

class Restaurant < ApplicationRecord
  CATEGORIES = ['Italian', 'Spanish', 'French', 'Japanese', 'Chinese', 'Indian']
  validates :name, presence: true
  validates :address, presence: true
  validates :category, inclusion: { in: CATEGORIES }
  has_many :tables, dependent: :destroy
  has_many :meals, dependent: :destroy
  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?
end

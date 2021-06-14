class Restaurant < ApplicationRecord
  CATEGORIES = ['Italian', 'Spanish', 'French', 'Japanese', 'Chinese', 'Indian']
  validates :name, presence: true
  validates :address, presence: true
  validates :category, inclusion: { in: CATEGORIES}
end

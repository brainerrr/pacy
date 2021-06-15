class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  validates :first_name, presence: true
  validates :last_name, presence: true
  has_many :baskets, dependent: :destroy

  def find_or_create_basket_for(table)
    (baskets.find_by status: "Pending", table: table) || baskets.create(table: table)
  end
end

class Store < ApplicationRecord
  has_many :products

  validates :name, :url, presence: true, uniqueness: true
end

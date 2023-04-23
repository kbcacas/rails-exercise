class Product < ApplicationRecord
  before_save :update_inventory_updated_time, if: :inventory_quantity_changed?

  belongs_to :store

  validates :name, :sku, presence: true, uniqueness: true
  validates :inventory_quantity, :store_id, presence: true

  def update_inventory_updated_time
    self.inventory_updated_time = Time.now
  end
end

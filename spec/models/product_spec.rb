require 'rails_helper'

RSpec.describe Product, :type => :model do
  let!(:store) { Store.create(name: "hello hi waddup", url: "hellothere.com") }

  context "when one field is missing" do
    it "is not valid" do
      product = Product.new(name: "Product1", inventory_quantity: 12, store_id: store.id)
  
      expect(product).not_to be_valid
    end  
  end

  context "when all fields are filled" do
    it "is valid" do
      product = Product.create(name: "Product1", sku:"AW-231231", inventory_quantity: 12, store_id: store.id)
  
      expect(product).to be_valid
    end
  end
end
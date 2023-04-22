require 'ffaker'
Product.destroy_all
Store.destroy_all

def generate_sku
  random_string = (0...8).map { (65 + rand(26)).chr }.join + rand(1000..9999).to_s
  sku = "SKU-#{random_string}"

  sku
end

def random_quantity
  rand(1..50)
end

def random_store_id
  rand(20..40)
end

10.times do
  Store.create(name: FFaker::Company.unique.name, url: FFaker::Internet.unique.http_url)
end

store_ids = Store.pluck(:id)

50.times do
  Product.create(
    name: FFaker::Product.unique.product_name,
    sku: generate_sku,
    inventory_quantity: random_quantity,
    store_id: store_ids.sample
  )
end

require 'rails_helper'

RSpec.describe Store, :type => :model do
  it "is not valid without a name" do
    store = Store.new(name: nil, url: "helloworld.com")

    expect(store).not_to be_valid
  end

  it "is not valid without a URL" do
    store = Store.new(name: "Hello store", url: nil)

    expect(store).not_to be_valid
  end

  it "is valid with name and URL" do
    store = Store.new(name: "Hello store", url: "helloworld.com")

    expect(store).to be_valid
  end
end
require 'rails_helper'

RSpec.describe Museum, type: :model do
  let(:museum) do
    Museum.new(name: "Test Museum", address: "Trafalgar Square")
  end

  it 'has a name' do
    expect(museum.name).to eq("Test Museum")
  end

  it 'has an address' do
    expect(museum.address).to eq("Trafalgar Square")
  end
end

require 'rails_helper'

RSpec.describe Review, type: :model do
  it 'should require all fields' do
    a = Review.new
    expect(a.valid?).to eq(false)
  end

  it 'should require rating between 1 and 5' do
    a = Review.new(rating: 10, product: Product.create, user: User.create)
    expect(a.valid?).to eq(false)
    expect(a.errors.size).to eq(1)
  end

end

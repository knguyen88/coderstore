require 'rails_helper'

RSpec.describe Product, type: :model do
  it 'name should be sorted alphabetically' do
    a = Product.create(
        name: 'Nón lá',
        description: 'A wonderful conical hat that forms a perfect right circular cone which tapers smoothly from the base to the apex',
        image_path: 'non.jpg',
        price_vnd: 20000.0,
        weight: 100
    )
    b = Product.create(
        name: 'Cowboy Hat',
        description: 'A high-crowned, wide-brimmed hat best known as the defining piece of attire for the North American cowboy.',
        image_path: 'cowboy.jpg',
        price_vnd: 500000.0,
        weight: 600
    )
    c = Product.create(
        name: '갓',
        description: 'A type of Korean traditional hat worn by men along with hanbok (Korean traditional clothing) during the Joseon period. It is made from horsehair with a bamboo frame and is partly transparent in black color.  Only married and middle class men during the late 19th century could wear gat, which represented their social status and protected their topknots (Hangul: 상투; RR: sangtu)',
        image_path: 'korean.jpg',
        price_vnd: 80000.0,
        weight: 300
    )

    expect(Product.alphabetical).to match_array([b, a, c])
  end

  it 'product on sale: 21% sale off test' do
    a = Product.create(
        name: 'Nón lá Test',
        description: 'A wonderful conical hat that forms a perfect right circular cone which tapers smoothly from the base to the apex',
        image_path: 'non.jpg',
        price_vnd: 100000.0,
        weight: 100
    )

    expect(a.price_after_saleoff).to eq(79000)
  end
end

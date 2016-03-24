RSpec.describe VisitorsController do
  describe "GET index" do
    products = []
    before(:each) do
      products << Product.create(
          name: 'Cowboy Hat',
          description: 'A high-crowned, wide-brimmed hat best known as the defining piece of attire for the North American cowboy.',
          image_path: 'cowboy.jpg',
          price_vnd: 500000.0,
          weight: 600
      )
      products << Product.create(
          name: 'Nón lá',
          description: 'A wonderful conical hat that forms a perfect right circular cone which tapers smoothly from the base to the apex',
          image_path: 'non.jpg',
          price_vnd: 20000.0,
          weight: 100
      )
      products << Product.create(
          name: '갓',
          description: 'A type of Korean traditional hat worn by men along with hanbok (Korean traditional clothing) during the Joseon period. It is made from horsehair with a bamboo frame and is partly transparent in black color.  Only married and middle class men during the late 19th century could wear gat, which represented their social status and protected their topknots (Hangul: 상투; RR: sangtu)',
          image_path: 'korean.jpg',
          price_vnd: 80000.0,
          weight: 300
      )
    end

    it "sort products alphabetical when param is present" do
      get :index, :sort => 'alphabetical'
      expect(assigns(:products)).to match_array(products)
    end


  end
end
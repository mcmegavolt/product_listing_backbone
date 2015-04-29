require 'rails_helper'

describe ProductsController do
  describe "GET #index" do
    it "responds successfully with an HTTP 200 status code" do
      get :index
      expect(response).to be_success
      expect(response).to have_http_status(200)
    end
    
    it "populates an array of products" do
      product = FactoryGirl.create(:product)
      get :index
      assigns(:products).should eq([product])
    end
    
    it "renders the :index view" do
      get :index
      response.should render_template :index
    end

    it "loads all of the products into @products" do
      product1, product2 = FactoryGirl.create(:product), FactoryGirl.create(:product)
      get :index

      expect(assigns(:products)).to match_array([product1, product2])
    end
  end
  
  describe "GET #show" do
    it "assigns the requested product to @product" do
      product = FactoryGirl.create(:product)
      get :show, id: product
      assigns(:product).should eq(product)
    end
    it "renders the :show template" do
      get :show, id: FactoryGirl.create(:product)
      response.should render_template :show
    end
  end
  
  describe "POST #create" do
    context "with valid attributes" do
      it "saves the new product in the database" do
        expect{
          post :create, product: FactoryGirl.attributes_for(:product)
        }.to change(Product,:count).by(1)
      end
    end
    
    context "with invalid attributes" do
      it "does not save the new product in the database" do
        expect{
          post :create, product: FactoryGirl.attributes_for(:invalid_product)
        }.to_not change(Product,:count)
      end
    end
  end

  describe 'PUT update' do
    before :each do
      @product = FactoryGirl.create(:product, name: "Jeans", description: "Jeans description")
    end
    
    context "valid attributes" do
      it "located the requested @product" do
        put :update, id: @product, product: FactoryGirl.attributes_for(:product)
        assigns(:product).should eq(@product)      
      end
    
      it "changes @product's attributes" do
        put :update, id: @product, product: FactoryGirl.attributes_for(:product, name: "Pants", description: "Pants description")
        @product.reload
        @product.name.should eq("Pants")
        @product.description.should eq("Pants description")
      end
    
    end
  end

  describe 'DELETE destroy' do
    before :each do
      @product = FactoryGirl.create(:product)
    end
    
    it "deletes the product" do
      expect{
        delete :destroy, id: @product        
      }.to change(Product,:count).by(-1)
    end
      
  end

end
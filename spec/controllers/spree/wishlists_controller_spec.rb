require 'spec_helper'

RSpec.describe Spree::WishlistsController, :type => :controller do
  
  let(:user) { create(:user) }
  let(:product) { create(:product) }
    
  before { 
    #@request.env['devise.mapping'] = Devise.mappings[:spree_user]
    allow(controller).to receive(:authenticate_spree_user!) {user}
    allow(controller).to receive(:spree_current_user) { user }
  }
    
  it 'use Spree::WishlistsController' do
    expect(controller).to be_an_instance_of Spree::WishlistsController
  end
  
  context '#index' do
    it "displays the wishlists for current user" do      
      spree_get :index
      expect(response).to render_template("spree/wishlists/index")
    end
  end
  
  context '#create' do    
    it "creates a new wishlist" do
      @request.env['HTTP_REFERER'] = 'http://localhost:3000/products/1'
      expect {
        spree_post :create, {:product_id => 1}
      }.to change(Spree::Wishlist, :count).by(1)
    end
  end

  context '#destroy' do       
    it "deletes the wishlist" do
      @wishlist = Spree::Wishlist.create(:user_id => user.id, :product_id => product.id)
      @wishlist.save!
      @request.env['HTTP_REFERER'] = 'http://localhost:3000/products/1'
      expect {
        spree_delete :destroy, {:id => @wishlist}
      }.to change(Spree::Wishlist, :count).by(-1)
    end
  end

end

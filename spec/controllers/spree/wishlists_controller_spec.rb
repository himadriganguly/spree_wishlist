require 'spec_helper'

RSpec.describe Spree::WishlistsController, :type => :controller do
  
  let(:user) { create(:user) }
  let(:wishlist) { create(:wishlist) }
  let(:attributes) { attributes_for(:wishlist) }
    
  before { allow(controller).to receive(:spree_current_user) { user } }
    
  it 'use Spree::WishlistsController' do
    expect(controller).to be_an_instance_of Spree::WishlistsController
  end
  
  context '#index' do
    it "displays the wishlists for current user" do      
      spree_get :index      
      expect(response).to render_template("index")
    end
  end
  
  context '#create' do
    let(:product) {create(:product)}
    it "creates a new wishlist" do
      expect {
        spree_post :create, {:user_id => user.id, :product_id => product.id}
      }.to change(Spree::Wishlist, :count).by(1)
    end
  end
  
end

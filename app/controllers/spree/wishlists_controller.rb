class Spree::WishlistsController < Spree::StoreController
  
  before_action :authenticate_spree_user!
   
  def index
    @wishlists = Spree::Wishlist.where(:user_id => spree_current_user.id)
  end
  
  def create
    
    @wishlist = Spree::Wishlist.new wishlist_attributes
    @wishlist.user_id = spree_current_user.id
    
    @wishlist.save
    redirect_to :back
    
  end
  
  def destroy
    
     @wishlist = Spree::Wishlist.where("product_id=? AND user_id=?",params[:id],spree_current_user.id).first
     @wishlist.destroy
     redirect_to :back
  end
  
  private
  
    def wishlist_attributes
      params.permit(:product_id)
    end
        
end

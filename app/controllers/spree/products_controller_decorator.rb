Spree::ProductsController.class_eval do
  
  before_action :check_wishlist, :only => :show
  
  private
    def check_wishlist
      if spree_current_user 
        if Spree::Wishlist.where("product_id=? AND user_id=?",@product.id,spree_current_user.id).first
          @wishlist_check = true
        else
          @wishlist_check = false
        end
      end
    end
  
end

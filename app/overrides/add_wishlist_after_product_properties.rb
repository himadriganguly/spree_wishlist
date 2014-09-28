Deface::Override.new(
  :virtual_path => "spree/products/show",
  :name => "add_submit_wishlist_link",
  :insert_after => "[data-hook='cart_form']",
  :partial => "spree/shared/wishlist"
)

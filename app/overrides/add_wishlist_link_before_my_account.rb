Deface::Override.new(
  :virtual_path => "spree/shared/_main_nav_bar",
  :name => "add_wishlist_link",
  :insert_after => "li#link-to-cart",
  :partial => "spree/shared/wishlist_link"
)
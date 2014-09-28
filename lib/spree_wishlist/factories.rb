FactoryGirl.define do
  # Define your Spree extensions Factories within this file to enable applications, and other extensions to use and override them.
  #
  # Example adding this to your spec_helper will load these Factories for use:
  # require 'spree_wishlist/factories'
  factory :wishlist, class: Spree::Wishlist do
    product_id 1
  end
end

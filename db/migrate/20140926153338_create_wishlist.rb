class CreateWishlist < ActiveRecord::Migration
  def change
    create_table :wishlists do |t|
      t.references :user
      t.references :product
      
      t.timestamps
    end
  end
end

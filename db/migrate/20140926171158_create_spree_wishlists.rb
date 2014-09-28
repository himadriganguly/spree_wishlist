class CreateSpreeWishlists < ActiveRecord::Migration
  def change
    create_table :spree_wishlists do |t|
      t.references :user
      t.references :product

      t.timestamps
    end
  end
end

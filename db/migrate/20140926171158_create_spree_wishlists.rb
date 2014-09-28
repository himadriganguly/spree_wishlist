class CreateSpreeWishlists < ActiveRecord::Migration
  def change
    create_table :spree_wishlists do |t|

      t.timestamps
    end
  end
end

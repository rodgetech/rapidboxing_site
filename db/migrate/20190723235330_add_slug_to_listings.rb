class AddSlugToListings < ActiveRecord::Migration[5.2]
  def change
    add_column :listings, :slug, :string
    add_index :listings, :slug, unique: true
  end
end

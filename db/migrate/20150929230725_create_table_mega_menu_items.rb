class CreateTableMegaMenuItems < ActiveRecord::Migration[5.0]
  def up
    if ActiveRecord::Base.connection.table_exists? 'spree_mega_menu_items'
      drop_table :spree_mega_menu_items
    end
    
    create_table :spree_mega_menu_items do |t|
      t.integer :parent_id
      t.string :title
      t.integer :weight
      t.string :link
      t.string :type_of_link
      t.boolean :top_level
      t.integer :spree_mega_menu_id
    end
    
    add_index :spree_mega_menu_items , :parent_id 
    add_index :spree_mega_menu_items , :spree_mega_menu_id 
  end
  def down
    drop_table :spree_mega_menu_items
  end
end

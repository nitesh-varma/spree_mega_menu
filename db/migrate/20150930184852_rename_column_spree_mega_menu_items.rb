class RenameColumnSpreeMegaMenuItems < ActiveRecord::Migration[5.0]
  def up
    rename_column :spree_mega_menu_items, :spree_mega_menu_id, :mega_menu_id
  end
  def down
    rename_column :spree_mega_menu_items, :mega_menu_id, :spree_mega_menu_id
  end
end

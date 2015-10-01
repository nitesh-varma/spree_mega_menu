class AddColumnToSpreeMegaMenuItems < ActiveRecord::Migration
  def change
    add_column :spree_mega_menu_items, :css_class, :string
    add_column :spree_mega_menu_items, :column, :integer
  end
end

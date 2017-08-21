class AddImageColumnsToMegaMenuItems < ActiveRecord::Migration[5.0]
def up
    add_attachment :spree_mega_menu_items, :menu_image
  end

  def down
    remove_attachment :spree_mega_menu_items, :menu_image
  end
end

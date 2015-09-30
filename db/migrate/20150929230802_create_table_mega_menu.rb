class CreateTableMegaMenu < ActiveRecord::Migration
  def change
    create_table :spree_mega_menus do |t|
      t.string :name
      t.boolean :enabled
    end
    
  end
end

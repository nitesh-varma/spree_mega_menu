class CreateTableMegaMenu < ActiveRecord::Migration[5.0]
  def change
    create_table :spree_mega_menus do |t|
      t.string :name
      t.boolean :enabled
    end
    
  end
end

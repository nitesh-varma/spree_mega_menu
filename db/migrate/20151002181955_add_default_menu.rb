class AddDefaultMenu < ActiveRecord::Migration
  def up
    Spree::MegaMenu.where(name: "Shop", enabled: true).first_or_create;
  end
  def down
    Spree::MegaMenu.where(name: "Shop").delete;
  end
end

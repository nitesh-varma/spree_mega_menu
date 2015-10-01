module Spree
  class MegaMenu < ActiveRecord::Base
    
    has_many :mega_menu_items, dependent: :destroy
    
    def build_menu
      self.mega_menu_items.where(top_level: true).order("weight ASC").map do |i| 
        {item: i, children: i.children} 
      end
    end

  end
end
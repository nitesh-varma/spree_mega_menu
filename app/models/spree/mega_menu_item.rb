module Spree
  class MegaMenuItem < ActiveRecord::Base
    belongs_to :mega_menu
    
    attr_accessor :parent_name
    before_save :get_taxon_path
    
    validates_presence_of :title
    validates_numericality_of :weight
    validates :type_of_link, inclusion: { in: %w(taxon page) , message: "%{value} is not a valid" }
    
    scope :top_level, lambda { where(parent_id: 0) }
    scope :get_children, lambda { |id| where(parent_id: id) }
    scope :weight_order, lambda { order("spree_mega_menu_items.weight ASC") }
    scope :desc_weight_order, lambda { order("spree_mega_menu_items.weight DESC") }
    
    
    # Add a child by passing id or MegaMenu Object
    def add_child item
      if item.is_a? Numeric 
        m = Spree::MegaMenuItem.find(item)
      end
      m.update_attributes(parent_id: self.id)
    end
    
    def children
      c = Spree::MegaMenuItem::get_children(self.id)
      c.map { |i|  { item: i, children: i.children } }
    end
    
    def parent_name
      return 'none' if self.parent_id == 0
      
      p = Spree::MegaMenuItem::find self.parent_id
      p.title
    end
    
        
    def check_top_level
      if self.top_level.to_i == 1
        self.parent_id = 0
      end
    end
    
    def get_taxon_path
      if self.type_of_link == "taxon"
        taxon = Taxon.find self.link
        return if taxon.blank? 
        self.link = taxon.permalink
      end
    end

    def children
      c = Spree::MegaMenuItem::get_children(self.id)
      c.map { |i|  { item: i, children: i.children } }
    end
    
    def parent_name
      return 'none' if self.parent_id == 0
      
      p = Spree::MegaMenuItem::find self.parent_id
      p.title
    end

    private
    
    def get_taxon_path
      if self.type_of_link == "taxon"
        taxon = Taxon.find self.link
        return if taxon.blank? 
        self.link = taxon.permalink
      end
    end
    
  end
end
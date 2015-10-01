module Spree
  class MegaMenuItem < ActiveRecord::Base
    belongs_to :mega_menu
    
    attr_accessor :parent_name
    before_save :check_top_level
    
    has_attached_file :menu_image, styles: { medium: "300x300>", thumb: "100x100>" }, default_url: "/images/:style/missing.png"
    validates_attachment_content_type :menu_image, content_type: /\Aimage\/.*\Z/
  
    validates_presence_of :title
    validates_numericality_of :weight
    validates :type_of_link, inclusion: { in: %w(taxon page) , message: "%{value} is not a valid" }
    
    #scope :top_level, lambda { |col=1| where(parent_id: 0, column: col).order("weight DESC") }
    scope :get_children, lambda { |id| where(parent_id: id).order("weight DESC") }
    scope :get_col_2, lambda { where(column: 2, parent_id: self.id).order("weight DESC") }
    
    # Add a child by passing id or MegaMenu Object
    def add_child item
      if item.is_a? Numeric 
        item = Spree::MegaMenuItem.find(item)
      end
      item.update_attributes(parent_id: self.id)
      
      #update the child column unless the parent is top level
      unless self.top_level
        item.update_attributes(column: self.column)
      end
    end
    
    def parent_name
      return 'none' if self.parent_id == 0
      
      p = Spree::MegaMenuItem::find self.parent_id
      p.title
    end
        
    def check_top_level
      if self.top_level == true
        self.parent_id = 0
      end
    end

    def children 
      c = Spree::MegaMenuItem::get_children(self.id)
      c.map { |i|  { item: i, children: i.children }  }
    end
    
    def parent_name
      return 'none' if self.parent_id == 0
      
      p = Spree::MegaMenuItem::find self.parent_id
      p.title
    end

    private
        
  end
end
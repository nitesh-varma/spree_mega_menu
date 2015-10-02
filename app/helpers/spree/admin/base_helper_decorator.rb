module Spree
  module Admin
    BaseHelper.module_eval do
      
      def mega_menu_build id
        mega_menu = MegaMenu.where(id: id).first_or_create(name: "Shop", enabled: true)
        return mega_menu.build_menu unless mega_menu.nil?
       
      end
  
      def mega_menu_link mega_menu_item, options = {prefix: '', suffix:'', class:'', count:1}
        if mega_menu_item.type_of_link == "taxon"
          
          if self.is_number? mega_menu_item.link
            url =  self.seo_url(Spree::Taxon.find(mega_menu_item.link))
          elsif mega_menu_item.link.is_a? String
            url = self.seo_url(Spree::Taxon.find_by_name(mega_menu_item.link))
          elsif mega_menu_item.link.class == Spree::Taxon
            url = self.seo_url(mega_menu_item.link)
          else
            url = mega_menu_item.link
          end
          
        end
        
        "<a class='cd-dropdown-item' href='#{url}'>
          #{options[:prefix]} #{mega_menu_item.title.pluralize(options[:count])} #{options[:suffix]}
        </a>".html_safe
      end
      
      def is_number? string
        true if Float(string) rescue false
      end
      
      def column_name num 
        case num
        when 1 
          "left"
        when 2
          "right"
        end
      end
      
    end
  end
end
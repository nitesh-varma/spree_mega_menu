module Spree
  module Admin
    BaseHelper.module_eval do
      
      def mega_menu_build id
        MegaMenu.find(id).build_menu
      end
  
      def mega_menu_link mega_menu_item, options = {prefix: '', suffix:'', class:''}
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
          #{options[:prefix]} #{mega_menu_item.title} #{options[:suffix]}
        </a>".html_safe
      end
      
      def is_number? string
        true if Float(string) rescue false
      end
      
    end
  end
end
Deface::Override.new(:virtual_path => "spree/layouts/admin",
                     :name => "admin_content_admin_tab_parser",
                     :insert_bottom => "[data-hook='admin_tabs']",
                     :text => "<ul class='nav nav-sidebar'><%= tab Spree.t(:mega_menus),  :url => '/admin/mega_menus', :icon => 'th-list' %></ul>",
                     :disabled => false)

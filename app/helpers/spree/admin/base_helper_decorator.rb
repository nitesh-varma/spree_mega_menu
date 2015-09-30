module Spree
  module Admin
    BaseHelper.module_eval do
      def mega_menu_build id
        MegaMenu.find(id).build_menu
      end
    end
  end
end
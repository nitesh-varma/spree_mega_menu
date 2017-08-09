module Spree
  class Admin::MegaMenusController < Admin::ResourceController
    
    before_action :set_mega_menu, only: [:edit, :links]
      
    # POST /mega_menus
    # POST /mega_menus.json
    def create
      @mega_menu = Spree::MegaMenu.new(mega_menu_params)
  
      respond_to do |format|
        if @mega_menu.save
          format.html { redirect_to admin_mega_menus_url, notice: 'Mega menu item was successfully created.' }
          format.json { render :show, status: :created, location: @mega_menu }
        else
          format.html { render :new }
          format.json { render json: @mega_menu.errors, status: :unprocessable_entity }
        end
      end
    end
    
    def links
      @menu_items = @mega_menu.mega_menu_items
    end
    
    private
    
    # Use callbacks to share common setup or constraints between actions.
    def set_mega_menu
      @mega_menu = MegaMenu.find(params[:id])
    end
    
    # Never trust parameters from the scary internet, only allow the white list through.
    def mega_menu_params
      params.require(:mega_menu).permit(:name, :enabled)
    end

  end 
end

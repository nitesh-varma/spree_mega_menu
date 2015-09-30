module Spree
  class Admin::MegaMenusController < Admin::ResourceController
    
    # GET /mega_menus
    # GET /mega_menus.json
    def index
      @mega_menu_items = Spree::MegaMenuItem.all
    end
    
    
    # GET /mega_menus/new
    def new
      @mega_menu = Spree::MegaMenuItem.new
    end
  
    # GET /mega_menus/1/edit
    def edit
    end
  
    # POST /mega_menus
    # POST /mega_menus.json
    def create
      @mega_menu = Spree::MegaMenuItem.new(mega_menu_params)
  
      respond_to do |format|
        if @mega_menu.save
          format.html { redirect_to admin_mega_menu_items_url, notice: 'Mega menu item was successfully created.' }
          format.json { render :show, status: :created, location: @mega_menu }
        else
          format.html { render :new }
          format.json { render json: @mega_menu.errors, status: :unprocessable_entity }
        end
      end
    end
    
    def links
      set_mega_menu
      
      @menu_items =  @mega_menu.mega_menu_items
    end
    
    private
    
    # Use callbacks to share common setup or constraints between actions.
    def set_mega_menu
      @mega_menu = MegaMenuItem.find(params[:id])
    end
    
    # Never trust parameters from the scary internet, only allow the white list through.
    def mega_menu_params
      params[:mega_menu_item].permit(:name, :enabled)
    end

  end 
end
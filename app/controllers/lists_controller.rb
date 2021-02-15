class ListsController < ApplicationController
  before_action :authenticate_user!,only:[:new,:create,:edit] 
  before_action :set_list, only: [:edit, :show, :update, :destroy,]

  

  def index  
    @lists = List.all


    
  end

  def new
    @list = List.new
  end

  

  def create
    @list = List.new(list_params)
    if @list.save
      redirect_to root_path
    else
      render :new

    end
  end

  def show

    if  @list.purchase.present?
      redirect_to root_path
      
    end
  
  end

  

  def edit  

    if  current_user.id != @list.user_id
      redirect_to lists_path

    end
    
    

  end

  def update

    
    @list.update(list_params)

    if  @list.update(list_params)
      redirect_to root_path
    else
      render :edit

    end

  end

  def destroy

    if  current_user.id == @list.user_id
      @list.destroy
      redirect_to root_path
     else 
      redirect_to root_path
     end

    
    
  end

  

      

    
  

  private
  def list_params
    params.require(:list).permit(:price, :item_name, :explanation, :area_id, :category_id, :condition_id, :shipping_fee_id, :shipping_date_id, :image).merge(user_id: current_user.id)

  end

  def set_list
    @list = List.find(params[:id])
  end

end



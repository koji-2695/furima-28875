class ListsController < ApplicationController
  def index  
    @lists = List.all
  end

  def new
    @list = List.new
  end

  def create
    @list = List.new(list_params)
    @list.valid?
    if @list.save
      redirect_to root_path
    else
      render :show

    end
  end
      

    
  

  private
  def list_params
    params.require(:list).permit(:price, :item_name, :explanation, :area_id, :category_id, :condition_id, :shipping_fee_id, :shipping_date_id).merge(user_id: current_user.id)

  end
end


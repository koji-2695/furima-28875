class ListsController < ApplicationController

  

  def index  
    
  end

  def new
    @list = List.new
    unless user_signed_in?
      flash[:alert] = "ログインしてください"
      redirect to root_path

    end

  end

  def create
    @list = List.new(list_params)
    
    if @list.save
      redirect to root_path
    else
      render :new

  end
end
      

    
  

  private
  def list_params
    params.require(:list).permit(:price, :item_name, :explanation, :area_id, :category_id, :condition_id, :shipping_fee_id, :shipping_date_id).merge(user_id: current_user.id)

  end
end


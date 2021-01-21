class ListsController < ApplicationController
  before_action :authenticate_user!,only:[:new,:create,] 

  

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

    @list = List.find(params[:id])


  end

  def edit  

    @list = List.find(params[:id])

  end

  def update

    @list = List.find(params[:id])
    @list.update(list_params)

    if @list.save
      redirect_to root_path
    else
      render :edit

    end

  end

      

    
  

  private
  def list_params
    params.require(:list).permit(:price, :item_name, :explanation, :area_id, :category_id, :condition_id, :shipping_fee_id, :shipping_date_id, :image).merge(user_id: current_user.id)

  end
end


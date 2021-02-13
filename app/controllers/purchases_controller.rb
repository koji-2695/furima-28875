class PurchasesController < ApplicationController
  before_action :authenticate_user!,only:[:index,:create] 
  before_action :set_list, only: [:index, :create]

  def index
    #フォームオブジェクトのインスタンスを生成し、インスタンス変数に代入する
    @purchase = FormObject.new

    if  current_user.id == @list.user_id || @list.shipping_fee.present?
      redirect_to root_path
      
    end

  end

  def create
    

    @purchase = FormObject.new(purchase_params)
    if @purchase.valid?
      pay_list
      @purchase.save
      return redirect_to root_path

    else
      render :index

  end

    
     



    
  end

  private
  def purchase_params
    params.require(:form_object).permit(:postal_code, :area_id, :municipality, :house_number, :building_name, :phone_number, ).merge(user_id: current_user.id,  list_id: params[:list_id], token: params[:token])

  end

  def set_list
    @list = List.find(params[:list_id])

  end

  def pay_list

    Payjp.api_key =  ENV["PAYJP_SECRET_KEY"]  
    Payjp::Charge.create(
        amount: @list.price,  
        card: purchase_params[:token],    
        currency: 'jpy'                 
      )

  end

  
end

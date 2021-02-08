class PurchasesController < ApplicationController

  def index
    #フォームオブジェクトのインスタンスを生成し、インスタンス変数に代入する
    @purchase = FormObject.new

  end

  def create
    

    @purchase = FormObject.new(purchase_params)
    if @purchase.save
      redirect_to root_path
    else
      render :new

    end

    if @purchase.valid?
      Payjp.api_key = "sk_test_5fc24df0e44f602329abd6e0"  # 自身のPAY.JPテスト秘密鍵を記述しましょう
      Payjp::Charge.create(
        amount: form_object_params[:price],  # 商品の値段
        card: form_object_params[:token],    # カードトークン
        currency: 'jpy'                 # 通貨の種類（日本円）
      )
      @purchase.save
      return redirect_to root_path
    else
      render :new
    end




    
  end

  private
  def purchase_params
    params.require(:form_object).permit(:postal_code, :area_id, :municipality, :house_number, :building_name, :phone_number, ).merge(user_id: current_user.id,  list_id: params[:list_id], token: params[:token])

  end

  
end

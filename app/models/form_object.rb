class FormObject
  include ActiveModel::Model
  attr_accessor :user_id, :list_id, :postal_code, :area_id, :municipality, :house_number, :building_name, :phone_number, :purchase, :token

  with_options presence: true do
    validates :user_id
    validates :list_id
    validates :postal_code
    validates :area_id
    validates :municipality
    validates :house_number
    validates :phone_number
    validates :token
    

    validates :postal_code, format: { with: /\A\d{3}[-]\d{4}\z/, message: '郵便番号は、ハイフンを付けてください' }
    validates :phone_number, format: { with: /\A\d{11}\z/, message: '電話番号は、11桁以内で登録してください' }


  end

  with_options numericality: { other_than: 0 , only_integer: true} do
    validates :area_id

  end


    def save

      purchase = Purchase.create(user_id: user_id, list_id: list_id, )
      Address.create(postal_code: postal_code, municipality: municipality, area_id: area_id, phone_number: phone_number, house_number: house_number, building_name: building_name, purchase_id: purchase.id)
      

      # 寄付金の情報を保存

      # 各テーブルにデータを保存する処理を書く
    end

end
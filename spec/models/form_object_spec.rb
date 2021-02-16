require 'rails_helper'

RSpec.describe FormObject, type: :model do

  before do
    @list = FactoryBot.create(:list) 
    @user = FactoryBot.create(:user)
    @purchase = FactoryBot.build(:form_object, list_id: @list.id, user_id: @user.id )
    
  end
  

  describe '商品購入' do

    context '商品購入がうまくいくとき' do

      it "郵便番号、都道府県、市区町村、番地、電話番号が存在すれば登録できる" do
        
        expect(@purchase).to be_valid
      end

      

      

      it "郵便番号はハイフンがあれば登録できる" do
        
        @purchase.postal_code = "555-3845"
        expect(@purchase).to be_valid
      end

      it "電話番号は11桁以内であれば登録できる" do
         
        @purchase.phone_number = "12345678901"
        expect(@purchase).to be_valid
      end


      it "建物名がない場合も登録できる" do
         
        @purchase.building_name = ""
        expect(@purchase).to be_valid
      end

      

    end

      
    context '商品購入がうまくいかないとき' do

      it "郵便番号が空だと登録できない" do
        
        @purchase.postal_code = ""  
        @purchase.valid?
        expect(@purchase.errors.full_messages).to include("Postal code can't be blank")
      end

      

      it "都道府県が空だと登録できない" do
        
        @purchase.area_id = ""  
        @purchase.valid?
        expect(@purchase.errors.full_messages).to include("Area can't be blank")
      end

      

      it "都道府県が0だと登録できない" do
        
        @purchase.area_id = 0 
        @purchase.valid?
        expect(@purchase.errors.full_messages).to include("Area must be other than 0")
      end


      it "市区町村が空だと登録できない" do
        
        @purchase.municipality = ""  
        @purchase.valid?
        expect(@purchase.errors.full_messages).to include("Municipality can't be blank")
      end



      it "番地が空だと登録できない" do
        
        @purchase.house_number = ""  
        @purchase.valid?
        expect(@purchase.errors.full_messages).to include("House number can't be blank")
      end

      it "電話番号が空だと登録できない" do
        
        @purchase.phone_number = ""  
        @purchase.valid?
        expect(@purchase.errors.full_messages).to include("Phone number can't be blank")
      end

      it "郵便番号は、ハイフンなしだと登録できない" do
        
        @purchase.postal_code = "1234567"
        @purchase.valid?
        expect(@purchase.errors.full_messages).to include("Postal code 郵便番号は、ハイフンを付けてください")
      end

      it "電話番号は、12桁以上だと登録できない" do
        
        @purchase.phone_number = "123456781234"
        @purchase.valid?
        expect(@purchase.errors.full_messages).to include("Phone number 電話番号は、11桁以内で登録してください")
      end

      it "tokenが空だと登録できない" do
        @purchase.token = nil
        @purchase.valid?
        expect(@purchase.errors.full_messages).to include("Token can't be blank")
      end

      it "電話番号にハイフンがある場合、登録できない" do

        @purchase.phone_number = "123-4567123"
        @purchase.valid?
        expect(@purchase.errors.full_messages).to include("Phone number 電話番号は、11桁以内で登録してください")

      end

      it "ユーザーIDが存在しない場合、登録できない" do

        @purchase.user_id = nil
        @purchase.valid?
        expect(@purchase.errors.full_messages).to include("User can't be blank")

      end

      it "商品のIDが存在しない場合、登録できない" do

        @purchase.list_id = nil
        @purchase.valid?
        expect(@purchase.errors.full_messages).to include("List can't be blank")

      end




    end

      

      

      

   

  end   
  
end


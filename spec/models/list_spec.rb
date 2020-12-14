require 'rails_helper'

RSpec.describe List, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
  describe '商品出品' do

    context '出品がうまくいくとき' do

      it "price、item_name、explanation、lister、category、condition、shipping_fee、area、shipping_dateが存在すれば登録できる" do
        @user = FactoryBot.build(:user)  
        expect(@user).to be_valid
      end

      it "priceは半角数字であれば登録できる" do
        @user = FactoryBot.build(:user)  
        @user.price = "55555"
        expect(@user).to be_valid
      end

      it "priceは300~9999999の範囲であれば登録できる" do
        @user = FactoryBot.build(:user)  
        @user.price = "3333333"
        expect(@user).to be_valid
      end

    end

    context '出品がうまくいかないとき' do

      it "priceが空だと登録できない" do
        @user = FactoryBot.build(:user)  
        @user.price = ""  
        @user.valid?
        expect(@user.errors.full_messages).to include("Price can't be blank")
      end

      it "item_nameが空だと登録できない" do
        @user = FactoryBot.build(:user)  
        @user.item_name = ""  
        @user.valid?
        expect(@user.errors.full_messages).to include("Item_name can't be blank")
      end

      it "explanationが空だと登録できない" do
        @user = FactoryBot.build(:user)  
        @user.explanation = ""  
        @user.valid?
        expect(@user.errors.full_messages).to include("Explanation can't be blank")
      end

      it "listerが空だと登録できない" do
        @user = FactoryBot.build(:user)  
        @user.lister = ""  
        @user.valid?
        expect(@user.errors.full_messages).to include("Lister can't be blank")
      end

      it "categoryが空だと登録できない" do
        @user = FactoryBot.build(:user)  
        @user.category = ""  
        @user.valid?
        expect(@user.errors.full_messages).to include("Category can't be blank")
      end

      it "conditionが空だと登録できない" do
        @user = FactoryBot.build(:user)  
        @user.condition = ""  
        @user.valid?
        expect(@user.errors.full_messages).to include("Condition can't be blank")
      end

      it "shipping_feeが空だと登録できない" do
        @user = FactoryBot.build(:user)  
        @user.shipping_fee = ""  
        @user.valid?
        expect(@user.errors.full_messages).to include("Shipping_fee can't be blank")
      end

      it "areaが空だと登録できない" do
        @user = FactoryBot.build(:user)  
        @user.area = ""  
        @user.valid?
        expect(@user.errors.full_messages).to include("Area can't be blank")
      end

      it "shipping_dateが空だと登録できない" do
        @user = FactoryBot.build(:user)  
        @user.shipping_date = ""  
        @user.valid?
        expect(@user.errors.full_messages).to include("Shipping_date can't be blank")
      end

      it "priceは半角数字以外は登録できない" do
        @user = FactoryBot.build(:user)
        @user.price = "aaaaa"
        @user.valid?
        expect(@user.errors.full_messages).to include("Price は半角数字を使用してください")
      end  

      it "priceは300~9999999の範囲外なら登録できない" do
        @user = FactoryBot.build(:user)
        @user.price = "555555555"
        @user.valid?
        expect(@user.errors.full_messages).to include("Price は300~9999999の範囲で使用してください")
      end  

    end

  end

end

require 'rails_helper'

RSpec.describe List, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"

  describe '商品出品' do

    context '商品出品がうまくいくとき' do

      it "商品名と商品の説明、カテゴリー、商品の状態、配送料の負担、発送元の地域、発送までの日数、販売価格が存在すれば登録できる" do
        @list = FactoryBot.build(:list)  
        expect(@list).to be_valid
      end

      

      it "販売価格は半角数字であれば登録できる" do
        @list = FactoryBot.build(:list)  
        @list.price = "50000"
        expect(@list).to be_valid
      end

      it "販売価格は300~9999999の範囲であれば登録できる" do
        @list = FactoryBot.build(:list)  
        @list.price = "7777777"
        expect(@list).to be_valid
      end

      

    end

      
    context '商品出品がうまくいかないとき' do

      it "商品名が空だと登録できない" do
        @list = FactoryBot.build(:list)  
        @list.item_name = ""  
        @list.valid?
        expect(@list.errors.full_messages).to include("Item_name can't be blank")
      end

      it "商品の説明が空だと登録できない" do
        @list = FactoryBot.build(:list)  
        @list.explanation = ""  
        @list.valid?
        expect(@list.errors.full_messages).to include("Explanation can't be blank")
      end

      it "カテゴリーが空だと登録できない" do
        @list = FactoryBot.build(:list)  
        @list.category = ""  
        @list.valid?
        expect(@list.errors.full_messages).to include("Category can't be blank")
      end

      it "商品の状態が空だと登録できない" do
        @list = FactoryBot.build(:list)  
        @list.condition = ""  
        @list.valid?
        expect(@list.errors.full_messages).to include("Condition can't be blank")
      end

      it "配送料の負担が空だと登録できない" do
        @list = FactoryBot.build(:list)  
        @list.shipping_fee = ""  
        @list.valid?
        expect(@list.errors.full_messages).to include("Shipping_fee can't be blank")
      end

      it "発送元の地域が空だと登録できない" do
        @list = FactoryBot.build(:list)  
        @list.area = ""  
        @list.valid?
        expect(@list.errors.full_messages).to include("Area can't be blank")
      end

      it "発送までの日数が空では登録できない" do
        @list = FactoryBot.build(:list)  
        @list.shipping_date = ""  
        @list.valid?
        expect(@list.errors.full_messages).to include("Shipping_date can't be blank")
      end

      
      
      it "販売価格は半角数字以外は登録できない" do
        @list = FactoryBot.build(:list) 
        @list.price = "ab"
        @list.valid?
        expect(@list.errors.full_messages).to include("Price は半角数字である必要があります")
      end

      it "販売価格は300~9999999の範囲でなければ登録できない" do
        @list = FactoryBot.build(:list) 
        @list.price = "3333333333"
        @list.valid?
        expect(@list.errors.full_messages).to include("Price は300~9999999の範囲内である必要があります")
      end

   end

  end  

end

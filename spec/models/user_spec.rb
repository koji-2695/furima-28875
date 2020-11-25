require 'rails_helper'
RSpec.describe User, type: :model do
  describe 'ユーザー新規登録' do

    context '新規登録がうまくいくとき' do

      it "nameとemail、その@マーク、birthday、passwordとpassword_confirmationが存在すれば登録できる" do
        expect(@user).to be_valid
      end

      it "passwordが6文字以上であれば登録できる" do
        @user.password = "000000"
        @user.password_confirmation = "000000"
        expect(@user).to be_valid
      end

      it "パスワードは半角英数字であれば登録できる" do
        @user.password = "/\A[a-z0-9]+\z/i"
        @user.password_confirmation = "/\A[a-z0-9]+\z/i"
        expect(@user).to be_valid
      end

      it "first_nameは全角文字であれば登録できる" do
        @user.first_name = "/\A[一-龥ぁ-ん]/"
        expect(@user).to be_valid
      end

      it "family_nameは全角文字であれば登録できる" do
        @user.family_name = "/\A[一-龥ぁ-ん]/"
        expect(@user).to be_valid
      end


      it "first_name_kanaは全角カタカナであれば登録できる" do
        @user.first_name_kana = "/[\p{katakana}ー－&&[^ -~｡-ﾟ]]+/"
        expect(@user).to be_valid
      end  

      it "family_name_kanaは全角カタカナであれば登録できる" do
        @user.family_name_kana = "/[\p{katakana}ー－&&[^ -~｡-ﾟ]]+/"
        expect(@user).to be_valid
      end  

      
    context '新規登録がうまくいかないとき' do

      it "ニックネームが空だと登録できない" do
        @user = FactoryBot.build(:user)  
        @user.name = ""  
        @user.valid?
        expect(@user.errors.full_messages).to include("Name can't be blank")
      end

      it "メールアドレスが空では登録できない" do
        @user = FactoryBot.build(:user)  
        @user.email = ""  
        @user.valid?
        expect(@user.errors.full_messages).to include("Email can't be blank")
      end

      it "パスワードが空では登録できない" do
        @user = FactoryBot.build(:user)  
        @user.password = ""  
        @user.valid?

        expect(@user.errors.full_messages).to include("Password can't be blank")
      end

      it "パスワードが5文字以下では登録できない" do
        @user = FactoryBot.build(:user) 
        @user.password = "12345"
        @user.password_confirmation = "12345"
        @user.valid?
        expect(@user.errors.full_messages).to include("Password is too short (minimum is 6 characters)")
      end

      it "生年月日が空では登録できない" do
        @user = FactoryBot.build(:user)  
        @user.birthday = ""  
        @user.valid?

        expect(@user.errors.full_messages).to include("Birthday can't be blank")
      end

      it "パスワードは半角英数字以外は登録できない" do
        @user = FactoryBot.build(:user) 
        @user.password = "aあ"
        @user.password_confirmation = "/\A[a-z0-9]+\z/i"
        @user.valid?
        expect(@user.errors.full_messages).to include("Password needs to include only half-width alphanumeric
          ")
      end

      it "emailは＠がないと登録できない" do
        @user = FactoryBot.build(:user)
        @user.email = "abced.co.jp"
        @user.valid?
        expect(@user.errors.full_messages).to include("Email needs to include @")
      end

      it "first_nameは全角文字以外は登録できない" do
        @user.first_name = "あa"
        @user.valid?
        expect(@user.errors.full_messages).to include("First_name needs to include only double-byte character
          ")
      end  

      it "family_nameは全角文字以外は登録できない" do
        @user.family_name = "あa"
        @user.valid?
        expect(@user.errors.full_messages).to include("Family_name needs to include only double-byte character
          ")
      end  

      it "first_name_kanaは全角カタカナ以外は登録できない" do
        @user.first_name_kana = "アあ"
        @user.valid?
        expect(@user.errors.full_messages).to include("First_name_kana needs to include only full-width katakana
          ")
      end

      it "family_name_kanaは全角カタカナ以外は登録できない" do
        @user.family_name_kana = "アあ"
        @user.valid?
        expect(@user.errors.full_messages).to include("Family_name_kana needs to include only full-width katakana
          ")
      end


    end
  end
end

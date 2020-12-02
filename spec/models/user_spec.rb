require 'rails_helper'
RSpec.describe User, type: :model do
  describe 'ユーザー新規登録' do

    context '新規登録がうまくいくとき' do

      it "nameとemail、その@マーク、birthday、passwordとpassword_confirmationが存在すれば登録できる" do
        @user = FactoryBot.build(:user)  
        expect(@user).to be_valid
      end

      it "passwordが6文字以上であれば登録できる" do
        @user = FactoryBot.build(:user)  
        @user.password = "000aaa"
        @user.password_confirmation = "000aaa"
        expect(@user).to be_valid
      end

      it "パスワードは半角英数字であれば登録できる" do
        @user = FactoryBot.build(:user)  
        @user.password = "judgement2695"
        @user.password_confirmation = "judgement2695"
        expect(@user).to be_valid
      end

      it "first_nameは全角文字であれば登録できる" do
        @user = FactoryBot.build(:user)  
        @user.first_name = "幸二"
        expect(@user).to be_valid
      end

      it "family_nameは全角文字であれば登録できる" do
        @user = FactoryBot.build(:user)  
        @user.family_name = "藤田"
        expect(@user).to be_valid
      end


      it "first_name_kanaは全角カタカナであれば登録できる" do
        @user = FactoryBot.build(:user)  
        @user.first_name_kana = "コウジ"
        expect(@user).to be_valid
      end  

      it "family_name_kanaは全角カタカナであれば登録できる" do
        @user = FactoryBot.build(:user)  
        @user.family_name_kana = "フジタ"
        expect(@user).to be_valid
      end  

      it "メールアドレスは一意性があれば登録できる" do
        @user = FactoryBot.create(:user, email:'test@example')  
        @author = FactoryBot.build(:user, email:'test@example')  
        # expect(user).to_not be_valid
        @author.valid?
       expect(@author.errors.full_messages).to include("Email has already been taken")
        # expect(@user).to be_valid
        
      end


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
        @user.password_confirmation = "aあ"
        @user.valid?
        expect(@user.errors.full_messages).to include("Password は半角の英字・数字それぞれ１文字以上含む必要があります")
      end

      it "emailは＠がないと登録できない" do
        @user = FactoryBot.build(:user)
        @user.email = "abced.co.jp"
        @user.valid?
        expect(@user.errors.full_messages).to include("Email is invalid")
      end

      it "first_nameは全角文字以外は登録できない" do
        @user = FactoryBot.build(:user)
        @user.first_name = "あa"
        @user.valid?
        expect(@user.errors.full_messages).to include("First name 全角文字を使用してください")
      end  

      it "family_nameは全角文字以外は登録できない" do
        @user = FactoryBot.build(:user)
        @user.family_name = "あa"
        @user.valid?
        expect(@user.errors.full_messages).to include("Family name 全角文字を使用してください")
      end  

      it "first_name_kanaは全角カタカナ以外は登録できない" do
        @user = FactoryBot.build(:user)
        @user.first_name_kana = "アあ"
        @user.valid?
        expect(@user.errors.full_messages).to include("First name kana 全角カタカナを使用してください")
      end

      it "family_name_kanaは全角カタカナ以外は登録できない" do
        @user = FactoryBot.build(:user)
        @user.family_name_kana = "アあ"
        @user.valid?
        expect(@user.errors.full_messages).to include("Family name kana 全角カタカナを使用してください")
      end

      it "パスワードが半角数字のみの場合は登録できない" do
        @user = FactoryBot.build(:user) 
        @user.password = "123456"
        @user.password_confirmation = "123456"
        @user.valid?
        expect(@user.errors.full_messages).to include("Password は半角の英字・数字それぞれ１文字以上含む必要があります")
      end

      it "パスワードが半角英字のみの場合は登録できない" do
        @user = FactoryBot.build(:user) 
        @user.password = "abcdef"
        @user.password_confirmation = "abcdef"
        @user.valid?
        expect(@user.errors.full_messages).to include("Password は半角の英字・数字それぞれ１文字以上含む必要があります")
      end


      

    end
  end
end

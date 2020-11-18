require 'rails_helper'
RSpec.describe User, type: :model do
  describe 'ユーザー新規登録' do

    it "ニックネームが空だと登録できない" do
      @user.name = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("Name can't be blank")
    end

    it "メールアドレスが空では登録できない" do
      @user.email = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("Email can't be blank")
    end

    it "パスワードが空では登録できない" do
      @user.password = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("Password can't be blank")
    end

    it "パスワードが5文字以下では登録できない" do
      @user.password = "12345"
      @user.password_confirmation = "12345"
      @user.valid?
      expect(@user.errors.full_messages).to include("Password is too short (minimum is 6 characters)")
    end

    it "生年月日が空では登録できない" do
      @user.birthday = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("Birthday can't be blank")
    end

    it "パスワードは半角英数字以外は登録できない" do
      @user.password = "/\A[a-z0-9]+\z/i"
      @user.password_confirmation = "/\A[a-z0-9]+\z/i"
      @user.valid?
      expect(@user.errors.full_messages).to include("Password needs to include only half-width alphanumeric
        ")
    end

    it "emailは＠を含む必要がある" do
      @user.email = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("Email needs to include @")
    end


end

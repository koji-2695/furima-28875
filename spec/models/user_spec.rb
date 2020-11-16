require 'rails_helper'
RSpec.describe User, type: :model do
  describe 'ユーザー新規登録' do
    it "ニックネームが空だと登録できない" do
    end
    it "メールアドレスが空では登録できない" do
    end
    it "パスワードが空では登録できない" do
    end
    it "パスワードが5文字以下では登録できない" do
    end
    it "生年月日が空では登録できない" do
    end
    it "パスワードは半角英数字以外は登録できない" do
  end
end

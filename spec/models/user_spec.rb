require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
    context '新規登録がうまくいくとき' do
      it "nicknameとemail、passwordとpassword_confirmation,first_name,last_name,first_name_read,last_name_read,birthdayが存在すれば登録できる" do
        expect(@user).to be_valid
      end
      it "passwordが６文字以上の英数字の組み合わせなら登録できる"do
        @user.password ="1234abc"
        @user.password_confirmation = @user.password
        expect(@user).to be_valid
      end
    end

    context '新規登録がうまくいかないとき' do
      it "nicknameが空だと登録できない" do
        @user.nickname = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Nickname can't be blank")
      end
      it "emailが空では登録できない" do
        @user.email = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Email can't be blank")
      end
      it "first_nameが空では登録できない" do
        @user.first_name = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("First name can't be blank")
      end
      it "last_nameが空では登録できない" do
        @user.last_name = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name can't be blank")
      end
      it "first_name_readが空では登録できない" do
        @user.first_name_read = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("First name read can't be blank")
      end
      it "last_name_readが空では登録できない" do
        @user.last_name_read = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name read can't be blank")
      end
      it "birthdayが空では登録できない" do
        @user.birthday = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Birthday can't be blank")
      end
      it "emailが重複していると登録できない" do
        @user.save
        another_user = FactoryBot.build(:user)
        another_user.email = @user.email
        another_user.valid?
        expect(another_user.errors.full_messages).to include("Email has already been taken")
      end
      it "first_nameがひらがな・カタカナ・漢字以外では登録できない" do
        @user.first_name = 1234
        @user.valid?
        expect(@user.errors.full_messages).to include("First name is invalid")
      end
      it "last_nameがひらがな・カタカナ・漢字以外では登録できない" do
        @user.last_name = 1234
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name is invalid")
      end
      it "first_name_readがカタカナ以外では登録できない" do
        @user.first_name_read = 1234
        @user.valid?
        expect(@user.errors.full_messages).to include("First name read is invalid")
      end
      it "last_name_readがカタカナ以外では登録できない" do
        @user.last_name_read = 1234
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name read is invalid")
      end
      it "passwordが5文字以下では登録できない" do
        @user.password = "123ab"
        @user.password_confirmation = @user.password
        @user.valid?
        expect(@user.errors.full_messages).to include("Password is invalid")
      end
      it "passwordが英数字の組み合わせでないと登録できない" do
        @user.password = 1234567
        @user.password_confirmation = @user.password
        @user.valid?
        expect(@user.errors.full_messages).to include("Password is invalid")
      end
    end
  end
end

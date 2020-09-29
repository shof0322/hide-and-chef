require 'rails_helper'

RSpec.describe Chef, type: :model do
  before do
    @chef = FactoryBot.build(:chef)
    @chef.image = fixture_file_upload("/test_image.jpg")
    @user = FactoryBot.build(:user)
    @user.save
    @chef.user_id = @user.id
  end

  describe 'シェフ新規登録' do
    context '新規登録がうまくいくとき' do
      it "image,name,explanation,commitment,city,address,prefecture_id,category_id,phone_numが存在すれば登録できる" do
        expect(@chef).to be_valid
      end
    end
    context '新規登録がうまくいかないとき' do
      it "nameが空だと登録できない" do
        @chef.name = ""
        @chef.valid?
        expect(@chef.errors.full_messages).to include("Name can't be blank")
      end
      it "imageが空では登録できない" do
        @chef.image = nil
        @chef.valid?
        expect(@chef.errors.full_messages).to include("Image can't be blank")
      end
      it "explanationが空では登録できない" do
        @chef.explanation = ""
        @chef.valid?
        expect(@chef.errors.full_messages).to include("Explanation can't be blank")
      end
      it "commitmentが空では登録できない" do
        @chef.commitment = ""
        @chef.valid?
        expect(@chef.errors.full_messages).to include("Commitment can't be blank")
      end
      it "cityが空では登録できない" do
        @chef.city = ""
        @chef.valid?
        expect(@chef.errors.full_messages).to include("City can't be blank")
      end
      it "addressが空では登録できない" do
        @chef.address = ""
        @chef.valid?
        expect(@chef.errors.full_messages).to include("Address can't be blank")
      end
      it "user_idが空では登録できない" do
        @chef.user_id = ""
        @chef.valid?
        expect(@chef.errors.full_messages).to include("User must exist")
      end
      it "prefecture_idが1だと登録できない" do
        @chef.prefecture_id = 1
        @chef.valid?
        expect(@chef.errors.full_messages).to include("Prefecture must be other than 1")
      end
      it "category_idが1だと登録できない" do
        @chef.category_id = 1
        @chef.valid?
        expect(@chef.errors.full_messages).to include("Category must be other than 1")
      end
      it "phone_numが空では登録できない" do
        @chef.phone_num = ""
        @chef.valid?
        expect(@chef.errors.full_messages).to include("Phone num can't be blank")
      end
      it "phone_numが半角数字11桁以外では登録できない" do
        @chef.phone_num = "０９０１２３４５６７８"
        @chef.valid?
        expect(@chef.errors.full_messages).to include("Phone num is invalid")
      end
    end
  end
end
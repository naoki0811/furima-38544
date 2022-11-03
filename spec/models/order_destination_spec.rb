require 'rails_helper'

RSpec.describe OrderDestination, type: :model do
  before do
    user = FactoryBot.create(:user)
    item = FactoryBot.build(:item)
    item.image = fixture_file_upload("/files/test_image.png")
    item.save
    @order_destination = FactoryBot.build(:order_destination, user_id: user.id, item_id: item.id)
  end


  describe '商品購入' do
    context '商品購入できる時' do
      it "フォームに情報が正しく入力されていれば購入できる" do
        expect(@order_destination).to be_valid
      end

      it '建物名が空でも購入できる' do
        @order_destination.build = ""
        expect(@order_destination).to be_valid
      end
    end

    context '商品購入ができない時' do
      it 'post_codeが空では購入できない' do
        @order_destination.post_code = ''
        @order_destination.valid?
        expect(@order_destination.errors.full_messages).to include("Post code can't be blank")
      end

      it '郵便番号は、ハイフンを含んだ正しい形式でないと購入できない' do
        @order_destination.post_code = '1234567'
        @order_destination.valid?
        expect(@order_destination.errors.full_messages).to include("Post code is invalid")
      end

      it 'prefecture_id が空では購入できない' do
        @order_destination.prefecture_id  = ''
        @order_destination.valid?
        expect(@order_destination.errors.full_messages).to include("Prefecture can't be blank")
      end

      it 'prefecture_idが選択されていなかったら購入できない' do
        @order_destination.prefecture_id = 0
        @order_destination.valid?
        expect(@order_destination.errors.full_messages).to include("Prefecture can't be blank")
      end

      it 'cityが空では購入できない' do
        @order_destination.city = ''
        @order_destination.valid?
        expect(@order_destination.errors.full_messages).to include("City can't be blank")
      end

      it 'addressが空では購入できない' do
        @order_destination.address = ''
        @order_destination.valid?
        expect(@order_destination.errors.full_messages).to include("Address can't be blank")
      end

      it 'phone_numberが空では購入できない' do
        @order_destination.phone_number = ''
        @order_destination.valid?
        expect(@order_destination.errors.full_messages).to include("Phone number can't be blank")
      end

      it 'phone_numberが9桁以下では購入できない' do
        @order_destination.phone_number = 1001
        @order_destination.valid?
        expect(@order_destination.errors.full_messages).to include("Phone number is invalid")
      end

      it 'phone_numberが12桁以上では購入できない' do
        @order_destination.phone_number = 100000000001
        @order_destination.valid?
        expect(@order_destination.errors.full_messages).to include("Phone number is invalid")
      end

      it 'phone_numberが半角数字以外が含まれていると購入できない' do
        @order_destination.phone_number = 100-111
        @order_destination.valid?
        expect(@order_destination.errors.full_messages).to include("Phone number is invalid")
      end

      it 'userが紐ついていないと購入できない' do
        @order_destination.user_id = nil
        @order_destination.valid?
        expect(@order_destination.errors.full_messages).to include("User can't be blank")
      end

      it 'itemが紐ついていないと購入できない' do
        @order_destination.item_id = nil
        @order_destination.valid?
        expect(@order_destination.errors.full_messages).to include("Item can't be blank")
      end

      it 'クレジットカートのトークンが空では購入できない' do
        @order_destination.token = ""
        @order_destination.valid?
        expect(@order_destination.errors.full_messages).to include("Token can't be blank")
      end
    end
  end
end
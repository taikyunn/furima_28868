require 'rails_helper'

RSpec.describe UserPurchase, type: :model do
  describe Place do
    before do
      @user_purchase = FactoryBot.build(:user_purchase)
    end

    describe '商品購入機能' do
      context '商品購入が上手くいく時' do
        it '全てが上手くいくと商品購入できる' do
          expect(@user_purchase).to be_valid
        end

        context '商品購入が上手くいかない時' do
          it 'prefecture_idが空だと購入できない' do
            @user_purchase.prefecture_id = nil
            @user_purchase.valid?
            expect(@user_purchase.errors.full_messages).to include(["Prefecture can't be blank", "Prefecture is not a number")
          end
          it 'postal_codeが空だと購入できない' do
            @user_purchase.postal_code = nil
            @user_purchase.valid?
            expect(@user_purchase.errors.full_messages).to include("Postal code can't be blank")
          end
          it 'postal_codeにハイフンがないと購入できない' do
            @user_purchase.postal_code = '1111111'
            @user_purchase.valid?
            expect(@user_purchase.errors.full_messages).to include("Postal code is invalid")
          end
          it 'cityが空だと購入できない' do
            @user_purchase.city = nil
            @user_purchase.valid?
            expect(@user_purchase.errors.full_messages).to include("City can't be blank")
          end
          it 'addressが空だと購入できない' do
            @user_purchase.address = nil
            @user_purchase.valid?
            expect(@user_purchase.errors.full_messages).to include("Address can't be blank")
          end
          it 'phone_numberが空だと購入できない' do
            @user_purchase.phone_number = nil
            @user_purchase.valid?
            expect(@user_purchase.errors.full_messages).to include("Phone number can't be blank")
          end
          it 'phone_numberが11桁より多いと購入できない' do
            @user_purchase.phone_number = '111111111111'
            @user_purchase.valid?
            expect(@user_purchase.errors.full_messages).to include("Phone number は11桁以内の数字（ハイフン不要）で入力してください")
          end
          it 'phone_numberはハイフンがあると購入できない' do
            @user_purchase.phone_number = '080-1234-5678'
            @user_purchase.valid?
            expect(@user_purchase.errors.full_messages).to include("Phone number は11桁以内の数字（ハイフン不要）で入力してください")
          end
          it 'user_idが空だと購入できない' do
            @user_purchase.prefecture_id = nil
            @user_purchase.valid?
            expect(@user_purchase.errors.full_messages).to include("Prefecture can't be blank")
          end
          it 'purchase_idが空だと購入できない'do
            @user_purchase.purchase_id = nil
            @user_purchase.valid?
            expect(@user_purchase.errors.full_messages).to include("Purchase can't be blank")
          end
          it 'tokenが空だと購入できない' do
            @user_purchase.token = nil
            @user_purchase.valid?
            expect(@user_purchase.errors.full_messages).to include("Token can't be blank")
          end
        end
      end
    end
  end
end

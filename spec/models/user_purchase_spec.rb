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
            expect(@user_purchase.errors.full_messages).to include('都道府県を選択してください')
          end
          it 'postal_codeが空だと購入できない' do
            @user_purchase.postal_code = nil
            @user_purchase.valid?
            expect(@user_purchase.errors.full_messages).to include('郵便番号は（ハイフン必須）で入力してください')
          end
          it 'postal_codeにハイフンがないと購入できない' do
            @user_purchase.postal_code = '1111111'
            @user_purchase.valid?
            expect(@user_purchase.errors.full_messages).to include('郵便番号は（ハイフン必須）で入力してください')
          end
          it 'cityが空だと購入できない' do
            @user_purchase.city = nil
            @user_purchase.valid?
            expect(@user_purchase.errors.full_messages).to include('市区町村を入力してください')
          end
          it 'addressが空だと購入できない' do
            @user_purchase.address = nil
            @user_purchase.valid?
            expect(@user_purchase.errors.full_messages).to include('番地を入力してください')
          end
          it 'phone_numberが空だと購入できない' do
            @user_purchase.phone_number = nil
            @user_purchase.valid?
            expect(@user_purchase.errors.full_messages).to include('電話番号を入力してください')
          end
          it 'phone_numberが11桁より多いと購入できない' do
            @user_purchase.phone_number = '111111111111'
            @user_purchase.valid?
            expect(@user_purchase.errors.full_messages).to include('電話番号は11桁以内の数字（ハイフン不要）で入力してください')
          end
          it 'phone_numberはハイフンがあると購入できない' do
            @user_purchase.phone_number = '080-1234-5678'
            @user_purchase.valid?
            expect(@user_purchase.errors.full_messages).to include('電話番号は11桁以内の数字（ハイフン不要）で入力してください')
          end
          it 'user_idが空だと購入できない' do
            @user_purchase.prefecture_id = nil
            @user_purchase.valid?
            expect(@user_purchase.errors.full_messages).to include('都道府県を選択してください')
          end
          it 'purchase_idが空だと購入できない' do
            @user_purchase.purchase_id = nil
            @user_purchase.valid?
            expect(@user_purchase.errors.full_messages).to include('Purchaseを入力してください')
          end
          it 'tokenが空だと購入できない' do
            @user_purchase.token = nil
            @user_purchase.valid?
            expect(@user_purchase.errors.full_messages).to include('カード情報を入力してください')
          end
        end
      end
    end
  end
end

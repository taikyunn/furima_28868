require 'rails_helper'

RSpec.describe UserPurchase, type: :model do
  describe Place do
    before do
      @user_purchase = FactoryBot.build(:user_purchase)
    end

    describe '商品購入機能'do
      context '商品購入が上手くいく時'do
        it '全てが上手くいくと商品購入できる' do
          expect(@place).to be_valid
        end

        context '商品購入が上手くいかない時' do
          it 'prefecture_idが空だと購入できない' do
            
          end
          it 'postal_codeが空だと購入できない' do
            
          end
          it 'postal_codeにハイフンがないと購入できない' do
            
          end
          it 'cityが空だと購入できない' do
            
          end
          it 'addressが空だと購入できない' do
            
          end
          it 'phone_numberが空だと購入できない' do
            
          end
          it 'phone_numberが11桁より多いと購入できない' do
            
          end
          it 'phone_numberが空だと購入できない' do
            
          end
          it 'purchase_idが空だと購入できない'do
          end
        end
      end
    end
  end
end

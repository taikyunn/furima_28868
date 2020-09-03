require 'rails_helper'

RSpec.describe Item, type: :model do
  describe Item do
    before do
      @user = FactoryBot.create(:user)
      @item = FactoryBot.build(:item, user_id: @user.id)
      @item.image = fixture_file_upload('test_image.jpg')
    end

    describe '商品出品機能' do
      context '商品出品が上手くいくとき' do
        it '全てが正しければ出品できる' do
          expect(@item).to be_valid
        end

      context '商品出品が上手くいかないとき' do
        it 'imageが空だと出品できない' do
          @item.image = nil
          @item.valid?
          expect(@item.errors.full_messages).to include("Image can't be blank")
        end
        it 'imageが複数存在すると出品できない' do
          user = FactoryBot.create(:user)
          item = build(:item)
          item.valid?
          expect(item.errors.full_messages).to include("Image can't be blank")
        end
        it 'titleが存在しないと出品できない' do
          @item.title = nil
          @item.valid?
          expect(@item.errors.full_messages).to include("Title can't be blank")
        end
        it 'introductionが存在しないと出品できない' do
          @item.introduction = nil
          @item.valid?
          expect(@item.errors.full_messages).to include("Introduction can't be blank")
        end
        it 'categoryが存在しないと出品できない' do
          @item.category = nil
          @item.valid?
          expect(@item.errors.full_messages).to include("Category can't be blank")
        end
        it 'statusが存在しないと出品できない' do
          @item.status = nil
          @item.valid?
          expect(@item.errors.full_messages).to include("Status can't be blank")
        end
        it 'postageが存在しないと出品できない' do
          @item.postage = nil
          @item.valid?
          expect(@item.errors.full_messages).to include("Postage can't be blank")
        end
        it 'areaが存在しないと出品できない' do
          @item.area = nil
          @item.valid?
          expect(@item.errors.full_messages).to include("Area can't be blank")
        end
        it 'shippingが存在しないと出品できない' do
          @item.shipping = nil
          @item.valid?
          expect(@item.errors.full_messages).to include("Shipping can't be blank")
        end
        it 'priceが存在しないと出品できない' do
          @item.price = nil
          @item.valid?
          expect(@item.errors.full_messages).to include("Price can't be blank")
        end
        it 'priceが¥300~¥9,999,999以外だと出品できない' do
          @item.price = '299'
          @item.valid?
          expect(@item.errors.full_messages).to include('Price must be greater than 300')
        end
        it 'priceが全角だと出品できない' do
          @item.price = '１１１１１'
          @item.valid?
          expect(@item.errors.full_messages).to include('Price is not a number')
        end
        it 'active_hashが1では登録できない' do
          @item.postage = '1'
          @item.valid?
          expect(@item.errors.full_messages).to include("Postage must be other than 1")
        end
      end
    end
  end
end
end
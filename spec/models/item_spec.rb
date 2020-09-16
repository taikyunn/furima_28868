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
            expect(@item.errors.full_messages).to include('画像を入力してください')
          end
          it 'imageが複数存在すると出品できない' do
            user = FactoryBot.create(:user)
            item = build(:item)
            item.valid?
            expect(item.errors.full_messages).to include('画像を入力してください')
          end
          it 'titleが存在しないと出品できない' do
            @item.title = nil
            @item.valid?
            expect(@item.errors.full_messages).to include('商品名を入力してください')
          end
          it 'introductionが存在しないと出品できない' do
            @item.introduction = nil
            @item.valid?
            expect(@item.errors.full_messages).to include('商品の説明を入力してください')
          end
          it 'category_idが存在しないと出品できない' do
            @item.category_id = nil
            @item.valid?
            expect(@item.errors.full_messages).to include('カテゴリーを選択してください')
          end
          it 'status_idが存在しないと出品できない' do
            @item.status_id = nil
            @item.valid?
            expect(@item.errors.full_messages).to include('商品の状態を選択してください')
          end
          it 'postageが存在しないと出品できない' do
            @item.postage_id = nil
            @item.valid?
            expect(@item.errors.full_messages).to include('配送料の負担を選択してください')
          end
          it 'areaが存在しないと出品できない' do
            @item.area_id = nil
            @item.valid?
            expect(@item.errors.full_messages).to include('発送元の地域を選択してください')
          end
          it 'shipping_idが存在しないと出品できない' do
            @item.shipping_id = nil
            @item.valid?
            expect(@item.errors.full_messages).to include('発送までの日数を選択してください')
          end
          it 'priceが存在しないと出品できない' do
            @item.price = nil
            @item.valid?
            expect(@item.errors.full_messages).to include('価格を入力してください')
          end
          it 'priceが¥300~¥9,999,999以外だと出品できない' do
            @item.price = '299'
            @item.valid?
            expect(@item.errors.full_messages).to include('価格は300円以上9,999,999円以下かつ半角で記入してください')
          end
          it 'priceが全角だと出品できない' do
            @item.price = '１１１１１'
            @item.valid?
            expect(@item.errors.full_messages).to include('価格は300円以上9,999,999円以下かつ半角で記入してください')
          end
          it 'active_hashが1では登録できない' do
            @item.postage_id = '1'
            @item.valid?
            expect(@item.errors.full_messages).to include('配送料の負担を選択してください')
          end
        end
      end
    end
  end
end

require 'rails_helper'

RSpec.describe Item, type: :model do
  describe '商品の出品' do
    before do
      @item = FactoryBot.build(:item)
    end

    context '内容に問題ない場合' do
      it 'すべての情報があれば登録できる' do
        expect(@item).to be_valid
      end
    end

    context '内容に問題がある場合' do
      it 'imageが空だと保存できないこと' do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Image can't be blank")
      end
      it 'nameが空だと保存できないこと' do
        @item.name = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Name can't be blank")
      end
      it 'captionが空だと保存できないこと' do
        @item.caption = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Caption can't be blank")
      end
      it 'categoryが1だと保存できないこと' do
        @item.category_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Category can't be blank")
      end
      it 'conditionが1だと保存できないこと' do
        @item.condition_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Condition can't be blank")
      end
      it 'feeが1だと保存できないこと' do
        @item.fee_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Fee can't be blank")
      end
      it 'prefectureが0だと保存できないこと' do
        @item.prefecture_id = 0
        @item.valid?
        expect(@item.errors.full_messages).to include("Prefecture can't be blank")
      end
      it 'periodが1だと保存できないこと' do
        @item.period_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Period can't be blank")
      end
      it 'priceが空だと保存できないこと' do
        @item.price = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Price can't be blank")
      end

      it 'priceが300未満であれば登録できないこと' do
        @item.price = 299
        @item.valid?
        expect(@item.errors.full_messages).to include('Price is invalid. Input  range of 300 to 9999999 numeric characters.')
      end

      it 'priceが10000000以上であれば登録できないこと' do
        @item.price = 10_000_000
        @item.valid?
        expect(@item.errors.full_messages).to include('Price is invalid. Input  range of 300 to 9999999 numeric characters.')
      end

      it 'priceが全角文字では登録できないこと' do
        @item.price = '１００００'
        @item.valid?
        expect(@item.errors.full_messages).to include('Price is invalid. Input  range of 300 to 9999999 numeric characters.')
      end

      it 'priceが英数字混合では登録できないこと' do
        @item.price = '300a'
        @item.valid?
        expect(@item.errors.full_messages).to include('Price is invalid. Input  range of 300 to 9999999 numeric characters.')
      end

      it 'priceが半角英字では登録できないこと' do
        @item.price = 'abc'
        @item.valid?
        expect(@item.errors.full_messages).to include('Price is invalid. Input  range of 300 to 9999999 numeric characters.')
      end

      it 'ユーザー情報がない場合は登録できないこと' do
        @item.user = nil
        @item.valid?
        expect(@item.errors.full_messages).to include('User must exist')
      end
    end
  end
end

require 'rails_helper'

describe User do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
    context '新規登録がうまくいく時' do
      it 'nicknameとemail,passwordとpassword-confirmation,first_nameとfamily_name,first_name_phoneticとfamily_name_phonetic,birthdayが存在すれば登録できる' do
        expect(@user).to be_valid
      end
      it 'passwordが6文字以上であれば登録できる' do
        @user.password = 'aaa111'
        @user.password_confirmation = 'aaa111'
        expect(@user).to be_valid
      end
      it 'first_nameとfamily_nameが全角（漢字・ひらがな・カタカナ）であれば登録できる' do
        @user.first_name = '亜あア'
        @user.family_name = '亜あア'
        expect(@user).to be_valid
      end
      it 'first_name_phoneticとfamily_name_phoneticが全角(カタカナ)であれば登録できる' do
        @user.first_name_phonetic = 'ヤマダ'
        @user.family_name_phonetic = 'タロウ'
        expect(@user).to be_valid
      end
    end

    context '新規登録がうまくいかない時' do
      it 'nicknameが空と登録できない' do
        @user.nickname = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Nickname can't be blank")
      end
      it 'emailが空だと登録できない' do
        @user.email = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Email can't be blank")
      end
      it '重複したemailが存在する場合登録できない' do
        @user.save
        another_user = FactoryBot.build(:user)
        another_user.email = @user.email
        another_user.valid?
        expect(another_user.errors.full_messages).to include('Email has already been taken', 'Email has already been taken')
      end
      it '@がないと保存できない' do
        @user.email = 'aaaaaa'
        @user.valid?
        expect(@user.errors.full_messages).to include('Email is invalid')
      end
      it 'passwordが空では登録できない' do
        @user.password = ''
        @user.password_confirmation = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Password can't be blank")
      end
      it 'passwordが5文字以下では登録できない' do
        @user.password = 'aaa11'
        @user.password = 'aaa11'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password is too short (minimum is 6 characters)')
      end
      it 'passwordが半角英数字でなければ登録できない' do
        @user.password = '１２３ａｂｃ'
        @user.password_confirmation = '１２３ａｂｃ'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password is invalid')
      end
      it 'passwordが存在していてもpassword_confirmationが空では登録できない' do
        @user.password = 'aaa111'
        @user.password_confirmation = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end
      it 'first_nameが空だと登録できない' do
        @user.first_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("First name can't be blank")
      end
      it 'first_nameが全角（漢字・ひらがな・カタカナ）でないと登録できない' do
        @user.first_name = 'aaa'
        @user.valid?
        expect(@user.errors.full_messages).to include('First name is invalid. Input full-width characters.')
      end
      it 'family_nameが空だと登録できない' do
        @user.family_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Family name can't be blank")
      end
      it 'family_nameが全角（漢字・ひらがな・カタカナ）でないと登録できない' do
        @user.family_name = 'aaa'
        @user.valid?
        expect(@user.errors.full_messages).to include('Family name is invalid. Input full-width characters.')
      end
      it 'first_name_phoneticが空だと登録できない' do
        @user.first_name_phonetic = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("First name phonetic can't be blank")
      end
      it 'first_name_phoneticが全角（カタカナ）でないと登録できない' do
        @user.first_name_phonetic = 'やまだ'
        @user.valid?
        expect(@user.errors.full_messages).to include('First name phonetic is invalid. Input full-width katakana characters.')
      end
      it 'family_name_phoneticが空だと登録できない' do
        @user.family_name_phonetic = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Family name phonetic can't be blank")
      end
      it 'family_name_phoneticが全角（カタカナ）でないと登録できない' do
        @user.family_name_phonetic = 'やまだ'
        @user.valid?
        expect(@user.errors.full_messages).to include('Family name phonetic is invalid. Input full-width katakana characters.')
      end
      it 'birthdayが空だと登録できない' do
        @user.birthday = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Birthday can't be blank")
      end
    end
  end
end

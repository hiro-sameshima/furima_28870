require 'rails_helper'
RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end
  context '新規登録がうまくいくとき' do
    it "全ての項目がが存在すれば登録できる" do
      expect(@user).to be_valid
    end
    it "passwordが6文字以上であれば登録できる" do
      @user.password = "test456"
      @user.password_confirmation = "test456"
      expect(@user).to be_valid
    end
  end
  context '新規登録がうまくいかないとき' do
    describe 'ユーザー新規登録' do
      it "nameが空だと登録できないこと" do
        @user.name = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Name can't be blank")
      end
      it "emailが空では登録できないこと" do
        @user.email = ""  
        @user.valid?
        expect(@user.errors.full_messages).to include("Email can't be blank")
      end
      it "重複したemailが存在する場合登録できないこと" do
        @user.save
        another_user = FactoryBot.build(:user)
        another_user.email = @user.email
        another_user.valid?
        expect(another_user.errors.full_messages).to include("Email has already been taken")
      end
      it "passwordが空では登録できないこと" do
        @user.password = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("Password can't be blank")
      end
      it "passwordが5文字以下であれば登録できないこと" do
        @user.password = "00000"
        @user.password_confirmation = "00000"
        @user.valid?
        expect(@user.errors.full_messages).to include("Password is too short (minimum is 6 characters)")
      end
      it "passwordは片方だけだと登録できない" do
        @user.password = "00000"
        @user.password_confirmation = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end
      it "パスワードは半角英数字混合でないと登録できない"do
          @user.password = "ああカか１３"
          @user.valid?
          expect(@user.errors.full_messages).to include("Password is invalid. Input half-width characters.")
      end
      it "ユーザー本名が、名字と名前が片方だけだと登録できない" do
        @user.family_name = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Family name can't be blank")
        end
      it "ユーザー本名が、名字と名前が片方だけだと登録できない" do
        @user.family_name = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Family name can't be blank")
        end
      it "ユーザー本名は全角（漢字・ひらがな・カタカナ）で入記入しないと登録できない"do
          @user.family_name = "aaaaa"
          @user.valid?
          expect(@user.errors.full_messages).to include("Family name is invalid. Input full-width katakana characters.")
      end
      it "ユーザー本名のフリガナが、名字と名前どちらも記入しないと登録できない"do
          @user.family_name_kana = ""
          @user.valid?
          expect(@user.errors.full_messages).to include("Family name kana can't be blank")
      end
      it "ユーザー本名のフリガナは全角（カタカナ）以外は登録されない"do
          @user.family_name_kana = "aあ１1"
          @user.valid?
          expect(@user.errors.full_messages).to include("Family name kana is invalid. Input full-width katakana characters.")
      end
      it "生年月日が空白だと登録できない"do
          @user.birthday = ""
          @user.valid?
          expect(@user.errors.full_messages).to include("Birthday can't be blank")
      end
      it "メールアドレスは@を含まないと登録できない"do
          @user.email = "same11com"
          @user.valid?
      end
    end
  end
end

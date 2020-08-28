FactoryBot.define do
  factory :user do
    name                  {Faker::Name.initials(number: 2)}
    email                 {Faker::Internet.free_email}
    password              {Faker::Internet.password(min_length: 6)}
    password_confirmation {password}
    family_name           {"テスト"}
    first_name            {'テスト'}
    family_name_kana      {'ヤマダ'}
    first_name_kana       {'リクタロウ'}
    birthday               {19320202}
  end
end

# t.string :family_name,        null: false
# t.string :first_name,         null: false
# t.string :family_name_kana,   null: false
# t.string :first_name_kana,    null: false
# t.date :birthday,             null: false
# ユーザー情報
# - ニックネームが必須であること
# - メールアドレスが必須であること
# - メールアドレスが一意性であること
# - メールアドレスは@を含む必要があること
# - パスワードが必須であること
# - パスワードは6文字以上であること
# - パスワードは半角英数字混合であること
# - パスワードは確認用を含めて2回入力すること
# - 新規登録・ログイン共にエラーハンドリングができていること（適切では無い値が入力された場合、情報は受け入れられず、エラーメッセージを出力させる）
# 本人情報確認
# - ユーザー本名が、名字と名前がそれぞれ必須であること
# - ユーザー本名は全角（漢字・ひらがな・カタカナ）で入力させること
# - ユーザー本名のフリガナが、名字と名前でそれぞれ必須であること
# - ユーザー本名のフリガナは全角（カタカナ）で入力させること
# - 生年月日が必須であること

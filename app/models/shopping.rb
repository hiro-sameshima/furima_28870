class Shopping < ApplicationRecord
  validates :price, presence: true #金額の入力を必須にする記述
end

class Shopping < ApplicationRecord
  # validates :price, presence: true #金額の入力を必須にする記述

  belongs_to :user
  belongs_to  :item
  has_one    :Address
end

class Shopping < ApplicationRecord
  belongs_to :user
  belongs_to :item
  has_one :Address ,dependent: :destroy 
end

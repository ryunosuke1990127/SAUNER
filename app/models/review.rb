class Review < ApplicationRecord
  belongs_to :member
  belongs_to :sauna
  has_many :comments, dependent: :destroy
end

class Tag < ApplicationRecord
  has_many :saunas, dependent: :destroy
end

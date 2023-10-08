class Region < ApplicationRecord
  has_many :saunas, dependent: :destroy
end

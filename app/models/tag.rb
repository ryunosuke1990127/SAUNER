class Tag < ApplicationRecord
  has_many :tag_saunas,dependent: :destroy, foreign_key: 'tag_id'
  has_many :saunas ,through: :tag_saunas
  
  
end

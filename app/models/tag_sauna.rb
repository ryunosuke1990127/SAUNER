class TagSauna < ApplicationRecord
  belongs_to :sauna
  belongs_to :tag
  
  validates :sauna_id ,presence: true
  validates :tag_id ,presence: true
end

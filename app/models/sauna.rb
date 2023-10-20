class Sauna < ApplicationRecord
  # 投稿用の画像ファイルを設定
  has_one_attached :image

  belongs_to :region
  belongs_to :member
  belongs_to :tag

  has_many :reviews, dependent: :destroy
end

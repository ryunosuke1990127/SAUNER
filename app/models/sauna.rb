class Sauna < ApplicationRecord
  # 投稿用の画像ファイルを設定
  has_one_attached :image

  belongs_to :region
  belongs_to :member

  has_many :favorites, dependent: :destroy
  has_many :reviews, dependent: :destroy
  has_many :tag_saunas, dependent: :destroy
  has_many :tags,through: :tag_saunas

  # バリデーション設定
  validates :name, presence: true
  validates :location, presence: true
  validates :post_reason, presence: true
  validates :price, presence: true

  # 画像投稿用のメソッド
  def get_iamge(width, height)
    unless image.attached?
      file_path = Rails.root.join('app/assets/images/no_image.jpeg')
      image.attach(io: File.open(file_path), filename: 'default-image.jpg', content_type: 'image/jpeg')
    end
      image.variant(resize_to_limit: [width, height]).processed
  end


  # タグ保存のためのメソッド
  def save_tag(sent_tags)
    # 現在存在するタグの取得
    current_tags = self.tags.pluck(:tag_name) unless self.tags.nil?
    # 現在取得したタグから送られてきたタグを除く
    old_tags = current_tags - sent_tags
    # 送られてきたタグから、存在するタグを除いたを新しいタグとする
    new_tags =sent_tags - current_tags

    # 古いタグの削除
    old_tags.each do |old|
      self.tags.delete Tag.find_by(tag_name: old)
    end

    # 新しいタグを保存
    new_tags.each do |new|
      new_post_tag = Tag.find_or_create_by(tag_name: new)
      self.tags << new_post_tag
    end
  end

  # いいねを押したユーザーがfavoriteテーブルに存在するかを確認するためのメソッド
  def favorited_by?(member)
    favorites.exists?(member_id: member.id)
  end
end

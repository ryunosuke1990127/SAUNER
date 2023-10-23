class Favorite < ApplicationRecord
  belongs_to :member
  belongs_to :sauna

  # 同じユーザーが一つのサウナ情報に複数回いいねを押せないようバリデーションを設定
  validates :member_id, uniqueness: {scope: :sauna_id}
end

class Public::TagsController < ApplicationController
  # タグの検索機能
  def search
    tag_name = params[:tag_name]
    # 入力したタグが含まれるタグ情報を取得
    tags = Tag.where("tag_name LIKE?","%#{tag_name}%")
    # 入力したタグ情報に紐づくサウナ情報
    @saunas_index = tags.flat_map(&:saunas)
  end
end

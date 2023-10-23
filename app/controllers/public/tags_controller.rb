class Public::TagsController < ApplicationController
  # タグの検索結果を取得
  def index
  end

  def search
    tag_name = params[:tag_name]
    tags = Tag.where("tag_name LIKE?","%#{tag_name}%")
    result = tags.inject(init=[]) {|result, tag| result + tag.saunas }
    byebug
    redirect_to tags_path
  end


end

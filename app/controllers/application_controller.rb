class ApplicationController < ActionController::Base
  # タグ検索欄用にからのインスタンスをセット
  @tag = Tag.new
end

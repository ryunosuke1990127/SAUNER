class Public::RegionsController < ApplicationController
  # 地域一覧を取得
  def index
    @region = Region.all
  end

  def create
  end
end

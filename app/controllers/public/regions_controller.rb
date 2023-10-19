class Public::RegionsController < ApplicationController
  # 地域一覧を取得
  def index
    @region = Region.all
    # フォームを作成するためからのインスタンスを作成
    @region_form = Region.new
  end

  def region_sauna
    # フォーム画面から送られてきた地域別idから対象の地域を取得
    @region_name = Region.find(params[:region][:region_id])
  end
end

class Public::SearchsController < ApplicationController

  # 絞り込み表示のため空のインスタンスを設定
  def new
    # どの地域のサウナかを識別するために現在選んでいる地域情報を取得
    @region_id = params[:region_id]
    @sauna = Sauna.new
  end

  # 絞り込み検索用のメソッド
  def search_sauna
    # どの地域のサウナかを識別するために現在選んでいる地域情報を取得
    region_id = params[:region_id]
    # 入力されている情報を取得
    price = params[:price]
    location = params[:location]
    # 入力情報をもとに対象のサウナを検索
    # @sauna_result = Sauna.where("price <= ? OR location LIKE ?", price, location).where(is_approve: true).where(region_id: region_id )
    @sauna_result = Sauna.where("price <= :price OR location LIKE :location", price: price, location: "%#{location}%").where(is_approve: true, region_id: region_id)
    if @sauna_result.empty?
      redirect_to search_search_fail_path
    end
  end

  # 検索失敗時の画面表示のためのアクション
  def search_fail
  end

end

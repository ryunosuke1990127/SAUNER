class Public::SearchsController < ApplicationController

  # 絞り込み表示のため空のインスタンスを設定
  def new
    @sauna = Sauna.new
  end

  def search_sauna
    # 入力されている情報を取得
    price = params[:price]
    location = params[:location]
    @sauna_result = Sauna.where("price <= ? ", "#{price}").where("location LIKE ?", "%#{location}%").where(is_approve: true)
  end

end

class Public::SearchsController < ApplicationController

  # 絞り込み表示のため空のインスタンスを設定
  def new
    @sauna = Sauna.new
  end

  def search_sauna
    # 入力されている情報を取得
    price = params[:price]
    favorite = params[:favorite]
    review = params[:review]
    @sauna_result = Sauna.where("price LIKE?","%#{price}%")
    byebug
  end

end

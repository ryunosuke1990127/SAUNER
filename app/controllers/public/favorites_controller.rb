class Public::FavoritesController < ApplicationController

  # いいねを押した時の処理
  def create
    # いいねを押した記事情報の取得
    sauna = Sauna.find(params[:sauna_id])
    favorite = current_member.favorites.new(sauna_id: sauna.id)
    favorite.save
    redirect_to sauna_path(sauna)
  end

  # いいねを2回押した(=いいねを解除した時の処理)
  def destroy
    # いいねを押した記事情報の取得
    sauna = Sauna.find(params[:sauna_id])
    favorite = current_member.favorites.find_by(sauna_id: sauna.id)
    favorite.destroy
    redirect_to sauna_path(sauna)
  end
end

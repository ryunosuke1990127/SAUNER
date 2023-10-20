class Public::SearchsController < ApplicationController

  # 絞り込み表示のため空のインスタンスを設定
  def new
    @sauna = Sauna.new
  end
end

class Admin::PostsController < ApplicationController
  # 投稿承認待ちの一覧取得
  def index
    @post_index = Sauna.all
  end

  # 投稿詳細を開くための処理
  def show
    @post = Sauna.find(params[:id])
  end

  def create
  end

  # 却下時の処理
  def destroy
    @post = Sauna.find(params[:id])
    byebug
    @post.destroy
    redirect_to 
  end

  def complete
  end

  def deny
  end
end

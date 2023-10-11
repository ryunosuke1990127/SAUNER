class Admin::PostsController < ApplicationController
  # 投稿承認待ちの一覧取得
  def index
    @post_index = Sauna.all
  end

  # 投稿詳細を開くための処理
  def show
    @post = Sauna.find(params[:id])
  end

  # 投稿申請されたもののbooleanをtrueからfalseへ変更する処理
  def update
    # 選択されたサウナ情報を取得
    @post_approve = Sauna.find(params[:id])
    # 取得されたサウナ情報の承認ステータスをtrueに変更(ユーザー側で表示させるようにするため)
    @post_approve.update(is_approve: true)
    redirect_to admin_posts_complete_path
  end

  # 却下時の処理
  def destroy
    @post = Sauna.find(params[:id])
    @post.destroy
    redirect_to admin_posts_deny_path
  end

  #完了画面を出すための処理
  def complete
  end

  #却下画面を出すための処理
  def deny
  end
end

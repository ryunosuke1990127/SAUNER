class Admin::MembersController < ApplicationController

  # 管理者側のユーザー一覧確認画面
  def index
    # 登録されているユーザーを取得
    @member = Member.all
  end

  # ユーザーの詳細ページの表示処理
  def show
    # クリックしたユーザー情報の取得
    @member = Member.find(params[:id])
  end


  # ユーザーのステータス無効の処理
  def withdraw
    # クリックしたユーザーの取得し、退会ステータスを有効から無効へ
    @member = Member.find(params[:member_id])
    @member.update(is_deleted: true)
    # セッションを消して会員一覧へ
    reset_session
    redirect_to admin_members_path
  end

end

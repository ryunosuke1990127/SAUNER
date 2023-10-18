class Admin::ReviewsController < ApplicationController
  # レビュー内容を確認するためユーザーの一覧を取得
  def index
    @member = Member.all
  end

  # そのユーザーのレビュー一覧を取得
  def member_index
    # クリックしたメンバーを取得
    @member = Member.find(params[:id])
    # そのユーザーのレビュー内容を取得
    @member_review = @member.reviews
  end

  # 日付をクリックしレビュー詳細を開く
  def show
    @review_detail = Review.find(params[:id])
  end

  # 確認画面へ遷移
  def confirm
    @review_detail = Review.find(params[:review_id])
  end

  # レビュー内容を削除する処理
  def destroy
    @review_delete = Review.find(params[:id])
    # 削除後は改めて一覧に戻るためユーザーIDを別変数に入れ退避させておく
    member_id = @review_delete.member.id
    @review_delete.destroy
    redirect_to admin_path(member_id)
  end


end

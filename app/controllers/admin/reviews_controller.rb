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

  def show
  end


end

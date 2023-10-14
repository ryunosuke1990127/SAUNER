class Public::ReviewsController < ApplicationController
  # レビュー投稿するためのフォーム
  def new
    # レビュー用のフォームのため空のインスタンスをセット
    @review = Review.new
    # レビューするサウナ情報を取得
    @sauna = Sauna.find_by(id: params[:sauna][:id])
    @member = current_member.name
  end

  # レビュー内容の詳細画面へ
  def show
    @review_detail = Review.find(params[:id])
  end

  def create
    @review = Review.new(review_params)
    @review.save
    redirect_to sauna_path(@review.sauna_id)
  end

  private

  def review_params
    params.require(:review).permit(:sauna_id, :member_id, :review_content)
  end


end

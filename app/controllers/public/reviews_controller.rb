class Public::ReviewsController < ApplicationController
  # レビュー投稿するためのフォーム
  def new
    # レビュー用のフォームのため空のインスタンスをセット
    @review = Review.new
    # レビューするサウナ情報を取得
    @sauna = Sauna.find_by(id: params[:sauna][:id])
    @member = current_member.name
  end

  def show
  end

  def create
    @review = Review.new(review_params)
    @review.save
    byebug
  end

  private

  def review_params
    params.require(:review).permit(:sauna_id, :member_id, :review_content)
  end


end

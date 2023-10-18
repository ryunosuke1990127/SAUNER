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
    # コメント用のフォームを準備するため空のインスタンスをセット
    @comment = Comment.new
  end

  def create
    @review = Review.new(review_params)
    @review.save
    redirect_to sauna_path(@review.sauna_id)
  end

  def comment_create
    @comment_content = Comment.new (comment_params)
    @comment_content.member_id = current_member.id
    @comment_content.save
    # saveまで完了したらページを更新するために前のページへリダイレクト
    redirect_back fallback_location: root_path
  end

  private

  # レビュー内容のパラメータ設定
  def review_params
    params.require(:review).permit(:sauna_id, :member_id, :review_content)
  end

  # コメント用のパラメータ設定
  def comment_params
    params.require(:comment).permit(:review_id, :member_id, :comment_content)
  end

end

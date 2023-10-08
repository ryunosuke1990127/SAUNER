class Public::SaunasController < ApplicationController
    # サウナ施設の一覧
    def index
    end

    def show
    end

    # サウナ施設の投稿用のフォームを準備
    def new
      # 投稿フォーム用の空のインスタンスをセット
      @sauna = Post.new
    end

    # サウナ投稿ないの申請ボタンが押された時の処理
    def create
      @sauna = Sauna.new(post_params)
      @sauna.save
      redirect_to saunas_create_check_path(@sauna.id)
    end

    # 投稿確認画面
    def create_cheak
    end

    # 投稿完了画面
    def complete
    end

    private
      # 投稿フォームからのパラメータ取得を許可
      def post_params
        params.require(:post).permit(:name,:price,:image,:post_reason,:location,:region_id)
      end
end
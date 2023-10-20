class Public::SaunasController < ApplicationController
    # サウナ施設の一覧取得処理
    def index
      @sauna_index = Sauna.all
    end

    # クリックされたサウナ情報の取得処理
    def show
      # サウナ情報の取得
      @sauna = Sauna.find(params[:id])
      # レビュー内容の取得
      @review = Review.all
    end

    # サウナ施設の投稿用のフォームを準備
    def new
      # 投稿フォーム用の空のインスタンスをセット
      @sauna = Sauna.new
    end

    # サウナ投稿ないの申請ボタンが押された時の処理
    def create
      @sauna = Sauna.new(sauna_params)
      tag = params[:sauna][:tag_name]
      byebug
      @sauna.member_id = current_member.id
      @sauna.save
      redirect_to sauna_create_check_path(@sauna.id)
    end

    # 投稿確認画面表示処理
    def create_cheak
      # 選択しているサウナ情報を取得
      @sauna = Sauna.find(params[:sauna_id])
    end

    # 投稿完了画面表示処理
    def complete
    end

    private
      # 投稿フォームからのパラメータ取得を許可
      def sauna_params
        params.require(:sauna).permit(:name,:price,:image,:post_reason,:location,:region_id,:member_id)
      end

end
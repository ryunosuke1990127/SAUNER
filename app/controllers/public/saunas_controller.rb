class Public::SaunasController < ApplicationController
    # サウナ施設の一覧
    def index
    end

    def show
    end

    # サウナ施設の投稿用のフォームを準備
    def new
      # 投稿フォーム用の空のインスタンスをセット
      @sauna = Sauna.new
    end

    # サウナ投稿ないの申請ボタンが押された時の処理
    def create
      @sauna = Sauna.new(sauna_params)
      @sauna.member_id = current_member.id
      @sauna.save
      redirect_to sauna_create_check_path(@sauna.id)
    end

    # 投稿確認画面
    def create_cheak
      # 選択しているサウナ情報を取得
      @sauna = Sauna.find(params[:sauna_id])
    end

    # 投稿完了画面
    def complete
    end

    private
      # 投稿フォームからのパラメータ取得を許可
      def sauna_params
        params.require(:sauna).permit(:name,:price,:image,:post_reason,:location,:region_id,:member_id)
      end
end
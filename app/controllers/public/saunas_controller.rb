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
      @review = @sauna.reviews
    end

    # サウナ施設の投稿用のフォームを準備
    def new
      # 投稿フォーム用の空のインスタンスをセット
      @sauna = Sauna.new
    end

    # サウナ投稿内の申請ボタンが押された時の処理
    def create
      # ログイン中のユーザーの投稿内容を取得
      @sauna = current_member.saunas.new(sauna_params)
      # 受け取った値を区切る
      tag_list = params[:sauna][:tag_name].split(',')
        if @sauna.save
          @sauna.save_tag(tag_list)
          redirect_to sauna_create_check_path(@sauna.id)
        else
        end
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
      params.require(:sauna).permit(:name,:price,:image,:post_reason,:location,:region_id)
    end

end
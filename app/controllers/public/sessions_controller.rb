# frozen_string_literal: true

class Public::SessionsController < Devise::SessionsController

before_action :configure_permitted_parameters, if: :devise_controller?
before_action :member_state,only:[:create]

def after_sign_in_path_for(resource)
     regions_path
end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name,:name_kana,:birth_place])
  end

  # ログインする前に会員ステータスを確認するための処理
  def member_state
    # 入力されたe-mailよりユーザー情報を取得
    @member = Member.find_by(email: params[:member][:email])
      if @member
        # 入力されたパスワード及び退会ステータスを確認
        if @member.valid_password?(params[:member][:password]) && (@member.is_deleted == true)
          flash[:notice] = "退会済みです。再度ご登録をしてご利用ください"
        redirect_to new_member_registration_path
        else
        # 正しく入力されていないとき
        flash[:notice] = "項目を入力してください"
        end
      else
      # 登録したユーザーが見つからなかった場合
      flash[:notice] = "該当するユーザーが見つかりません"
      end
  end
end

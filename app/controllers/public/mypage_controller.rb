class Public::MypageController < ApplicationController
  # マイページをクリックした際の処理
  def show
    @mypage = Member.find(current_member.id)
  end

  # ユーザーの行きたいリスト
  def favorite
    member_favorites = current_member.favorites
    @favorite_sauna = member_favorites.flat_map(&:sauna)
  end
end

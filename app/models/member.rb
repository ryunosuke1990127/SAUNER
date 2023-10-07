class Member < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  # def self.guest
  #   find_or_create_by!(email: 'guest@example.com') do |member|
  #     member.password = SecureRandom.urlsafe_base64
  #     member.name = "ゲスト"
  #     member.name_kana = "げすと"
  #     member.birth_place = "JP"
  #     member.is_deleted = false
  #     #＊上記は一例です。他に必要なカラムがあれば追記してください＊
  #   end
  # end
end

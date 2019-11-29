class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :bettings
  has_many :posts
  has_many :articles
  # mount_uploader :avatar, AvatarUploader
  has_one_attached :avatar

  validates :nickname,
  presence: {
    message: "ニックネームを入力してください"
  }
  validates :email,
    presence: {
      message: "メールアドレスを入力してください"
    }
  validates :email,
    uniqueness: {
      message: "既にアカウントが存在します"
    }
  validates :password,
  presence: true,
  length: {
    minimum: 7,
    too_short: "パスワードは7文字以上です"
  }
end

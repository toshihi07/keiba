class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :bettings
  has_many :posts, dependent: :destroy
  has_many :articles
  has_many :comments
  has_many :likes, dependent: :destroy
  has_many :liked_posts, through: :likes, source: :post
  # mount_uploader :avatar, AvatarUploader
  has_one_attached :avatar
  
  def already_liked?(post)
    self.likes.exists?(post_id: post.id)
  end

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

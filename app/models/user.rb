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

  validates :email, presence: true
  validates :password, presence: true
  validates :nickname, presence: true
  validates :avatar, presence: true
end

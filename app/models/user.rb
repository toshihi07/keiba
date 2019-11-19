class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :bettings
  has_many :posts
  has_many :articles
  mount_uploader :avatar, AvatarUploader
  has_one_attached :avatar
end

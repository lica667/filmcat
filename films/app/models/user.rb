class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :comments
  has_many :video_joins
  has_many :videos, through: :video_joins
  has_many :premiere_videos

  def admin?
  	email == "admin@asd.com"
  end
end

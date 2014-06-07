class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :omniauthable

  #attr_accessible :email, :password, :password_confirmation, :remember_me
  #attr_accessible :nickname, :provider, :url, :username

   has_many :comments
   has_many :film_joins
   has_many :films, through: :film_joins
end

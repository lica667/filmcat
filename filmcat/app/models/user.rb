class User < ActiveRecord::Base
	validates :name, :presence => true, :uniqueness => true, :length => {:in => 3..20}
	validates :email, :presence => true, :uniqueness => true, format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i}
	validates :password, :presence => true, :confirmation => true, length: {minimum: 8, maximum: 20}
	serialize :watched_films, Array
	serialize :future_films, Array

	#before_save :encrypt_password
 	#after_save :clear_password

  def encrypt_password
   if password.present?
      self.salt = BCrypt::Engine.generate_salt
      self.encrypted_password= BCrypt::Engine.hash_secret(password, salt)
    end
  end

  def clear_password
    self.password = nil
  end
end

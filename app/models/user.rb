class User < ActiveRecord::Base
    has_secure_password
    validates :first_name, presence: true
    validates :last_name, presence: true
    validates :email, presence: true, uniqueness: { case_sensitive: false ,without: /\s/ }
    validates :password, length: { minimum: 3 }
    def self.authenticate_with_credentials(email, password)
        @user = self.where("lower(email) = ?", email.delete(' ').downcase).first.try(:authenticate, password)
    end
end

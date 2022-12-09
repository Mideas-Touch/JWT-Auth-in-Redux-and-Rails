class User < ApplicationRecord

    has_secure_password

    validates :username, uniqueness: { case_sensitive: false}

    # We've no way of storing instances of Bcrypt::Password in our database. So we'll sore the password digests as strings
    # OUr User#authentication with Bcrypt might look like:


    # attr_accessor :password

    # def authenticate(plaintext_passwrord)
    #     if Bcrypt::Password.new(self.password_digest) == plaintext_passwrord
    #         self
    #     else
    #         false
    #     end
    # end

end

class Login < ApplicationRecord
    validates :email, presence: true, format: { with: URI::MailTo::EMAIL_REGEXP, message: "Not a valid email" }
    validates :password, presence: true, length: { in: 6..10 }

    def initialize (email, password)
        @email = email
        @password = password
    end

end

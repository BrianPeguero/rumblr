class User < ApplicationRecord
    has_many :post

    validates :email, presence: true, format: { with: URI::MailTo::EMAIL_REGEXP, message: "Not a valid email" }
    validates :password, presence: true, length: { in 6..10, too_long: "Your password is too long", too_short: "Your password is too short" }
    validates :name, presence: true, format: { with: /\A[a-zA-Z]+\z/, message: "Only allows letters, please enter your real name" } 
    validates :birthday, presence: true, format: { with: /[0-3]{1}[0-9]{1}\/[0-1]{1}[0-9]{1}\/[1-2]{1}[0-9]{3}/, message: "is bad data" }

end

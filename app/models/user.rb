class User < ApplicationRecord
    has_secure_password

    validates :first_name, :last_name, :password_confirmation, presence: true
    validates :password, presence: true, length: { minimum: 6 }
    validates :email, presence: true, uniqueness: true

    validates_format_of :password, with: /(?=.*[A-Z]+)(?=.*[0-9]+).*/

end

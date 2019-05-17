class User < ApplicationRecord
    has_secure_password

    validates :first_name, :last_name, :password_confirmation, presence: true
    validates :password, presence: true, length: { minimum: 6 }
    validates :email, presence: true, uniqueness: true

    validates_format_of :password, with: /(?=.*[A-Z]+)(?=.*[0-9]+).*/

    def generate_password_token!
      self.reset_password_token = generate_token
      self.reset_password_sent_at = Time.now.utc
      save!(validate: false)
    end

    def password_token_valid?
      (self.reset_password_sent_at + 4.hours) > Time.now.utc
    end

    def reset_password!(password)
      self.reset_password_token = nil
      self.password = password
      self.password_confirmation = password
      save!(validate: false)
    end

    private

    def generate_token
      SecureRandom.hex(10)
    end

end

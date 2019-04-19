class User < ApplicationRecord

	enum role_vp: %i[customer admin owner]
	enum gender_vp: %i[male female undefined other]
	
	before_save { self.email = email.downcase }
	
	EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/.freeze

	validates :api_token, presence: true, uniqueness: true
	validates :email, presence: true, uniqueness: true, format: { with:EMAIL_REGEX }

	has_secure_password
	has_secure_token :api_token

	before_validation :generate_api_token
	
	has_one :headquarters

	has_many :phones
	has_many :phones, through: :purchases

	def as_json(*)
		super(except: %i[password_digest created_at updated_at])
	end

	def generate_api_token
		return if api_token.present?

		loop do
			self.api_token = SecureRandom.hex
			break unless User.exists? api_token: api_token
		end
	end
end

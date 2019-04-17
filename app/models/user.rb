class User < ApplicationRecord

	enum role_vp: %i[customer admin owner]
	enum gender_vp: %i[male female undefined other]
	has_many :phones
	has_many :phones, through :purchases
end

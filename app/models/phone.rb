class Phone < ApplicationRecord

  enum brand_vp: %i[samsung huawei apple motorola xiaomi]
  belongs_to :headquarter
  has_many :users
	has_many :users, through :purchases
end

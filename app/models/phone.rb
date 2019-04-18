class Phone < ApplicationRecord

  enum brand_vp: %i[samsung huawei apple motorola xiaomi]
  belongs_to :headquarter
  has_one :users
	has_one :users, through: :purchases
end

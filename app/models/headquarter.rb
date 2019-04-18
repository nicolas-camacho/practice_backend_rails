class Headquarter < ApplicationRecord
  enum city_vp: %i[barranquilla bogota cali medellin]
  belongs_to :user
  has_many :phones
end

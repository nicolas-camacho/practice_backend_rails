json.status :ok
json.data do
	json.array! @users do |user|
		json.extract! user, :id, :role_vp, :gender_vp, :cc, :name, :address, :email, :phone_number, :date_of_birth
	end
end
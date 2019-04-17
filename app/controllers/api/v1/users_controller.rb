module Api
	module V1
		class UsersController < ApiController
			wrap_parameters :user, include: %i[role_vp gender_vp cc name address email password password_confirmation phone_number date_of_birth ]
			def index
				@users = User.all
				render json: { users: @users }, status: :ok
			end

			def genders
				render json: { data: User.gender_vps }, status: :ok
			end

			def create
				@user = User.new(user_params)
				if @user.save
					render json: { message: 'Insertado' }, status: :ok
				else
					render json: { message: 'User not inserted', data: @user.errors }, status: :unprocessable_entity
				end
			end

			private
			def user_params
				params.require(:user).permit!
			end
		end	
	end
end
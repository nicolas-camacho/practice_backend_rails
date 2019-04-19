module Api
	module V1
		class UsersController < ApiController

			before_action :set_user, only: %i[show update destroy]
			before_action :authenticate_token!, except: %i[login]

			wrap_parameters :user, include: %i[role_vp gender_vp cc name address email password password_confirmation phone_number date_of_birth ]
			def index
				@users = User.all
				render :index
			end

			def genders
				render json: { data: User.gender_vps }, status: :ok
			end

			def show
			end

			def login
				@user = User.find_by_email(params[:email])
				if @user&.authenticate(params[:password])
					render :login
				else
					render json: { message: "Invalid credentials" }, status: :unauthorized
				end
			end

			def logout
				if @api_user.update_column(:api_token, nil)
					render json: { message: 'Logged out successfully', data: @api_user }, status: :ok
				else
					render json: { message: 'User not logget out', data: @api_user.errors }, status: :unprocessable_entity
				end
			end

			def create
				@user = User.new(user_params)
				if @user.save
					render json: { message: 'Inserted' }, status: :ok
				else
					render json: { message: 'User not inserted', data: @user.errors }, status: :unprocessable_entity
				end
			end

			def update
				if @user.update(user_params)
					render json: { users: @user }, status: :ok 
				else
					render json: { message: 'User not updated', data: @user.errors }, status: :unprocessable_entity
				end
			end

			def destroy
				if @user.destroy
					render json: { users: @user }, status: :ok
				else
					render json: { message: 'User not deleted', data: @user.errors }, status: :unprocessable_entity
				end
			end

			private
			def user_params
				params.require(:user).permit!
			end

			def set_user
				@user = User.find(params[:id])
			end
		end	
	end
end
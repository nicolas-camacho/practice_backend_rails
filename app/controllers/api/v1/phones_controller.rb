module Api
	module V1
		class PhonesController < ApiController

			before_action :set_phone, only: %i[show update destroy]
			def index
				@phones = Phone.all
				render json: { phones: @phones }, status: :ok
			end

			def show
				render json: {data: @phone}, status: :ok
			end

			def create
				@phone = Phone.new(phone_params)
				if @phone.save
					render json: { message: 'Inserted' }, status: :ok
				else
					render json: { message: 'Phone not inserted', data: @phone.errors }, status: :unprocessable_entity
				end
			end

			def update
				if @phone.update(phone_params)
					render json: { phones: @phone }, status: :ok 
				else
					render json: { message: 'Phone not updated', data: @phone.errors }, status: :unprocessable_entity
				end
			end

			def destroy
				if @phone.destroy
					render json: { Phone: @phone }, status: :ok
				else
					render json: { message: 'Phone not deleted', data: @phone.errors }, status: :unprocessable_entity
				end
			end

			private
			def phone_params
				params.require(:phone).permit!
			end

			def set_phone
				@phone = Phone.find(params[:id])
			end
		end	
	end
end
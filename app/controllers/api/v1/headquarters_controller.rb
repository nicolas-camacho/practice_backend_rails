module Api
	module V1
		class HeadquartersController < ApiController

			before_action :set_headquarter, only: %i[show update destroy]
			def index
				@hqs = Headquarter.all
				render :index
			end

			def show
			end

			def create
				@hq = Headquarter.new(headquarter_params)
				if @hq.save
					render json: { message: 'Inserted' }, status: :ok
				else
					render json: { message: 'Headquarter not inserted', data: @hq.errors }, status: :unprocessable_entity
				end
			end

			def update
				if @hq.update(headquarter_params)
					render json: { headquarters: @hq }, status: :ok 
				else
					render json: { message: 'Headquarter not updated', data: @hq.errors }, status: :unprocessable_entity
				end
			end

			def destroy
				if @hq.destroy
					render json: { Headquarter: @hq }, status: :ok
				else
					render json: { message: 'Headquarter not deleted', data: @hq.errors }, status: :unprocessable_entity
				end
			end

			private
			def headquarter_params
				params.require(:headquarter).permit!
			end

			def set_headquarter
				@hq = Headquarter.find(params[:id])
			end
		end	
	end
end
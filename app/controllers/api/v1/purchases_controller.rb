module Api
	module V1
		class PurchasesController < ApiController

			before_action :set_purchase, only: %i[show update destroy]
			def index
				@purchases = Purchase.all
				render json: { purchases: @purchases }, status: :ok
			end

			def show
				render json: {data: @purchase}, status: :ok
			end

			def create
				@purchase = Purchase.new(purchase_params)
				if @purchase.save
					render json: { message: 'Inserted' }, status: :ok
				else
					render json: { message: 'Purchase not inserted', data: @purchase.errors }, status: :unprocessable_entity
				end
			end

			def update
				if @purchase.update(purchase_params)
					render json: {purchases: @purchase }, status: :ok 
				else
					render json: { message: 'Purchase not updated', data: @purchase.errors }, status: :unprocessable_entity
				end
			end

			def destroy
				if @purchase.destroy
					render json: { Purchase: @purchase }, status: :ok
				else
					render json: { message: 'Purchase not deleted', data: @purchase.errors }, status: :unprocessable_entity
				end
			end

			private
			def purchase_params
				params.require(:purchase).permit!
			end

			def set_purchase
				@purchase = Purchase.find(params[:id])
			end
		end	
	end
end
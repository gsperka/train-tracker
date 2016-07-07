class TransportationController < ApplicationController

	def index
		@transportation = Transportation.ordered.page(params[:page]).per(5)
	end

	def edit
		@single_transport = Transportation.find(params[:id])
	end

	def update
		@transport = Transportation.find(params[:id])
		@transport.update_attributes(transport_params)
		redirect_to :root
	end

	def destroy
		@remove_transport = Transportation.find(params[:id])
		@remove_transport.delete
		redirect_to :root
	end

	private 

  def transport_params
    params.require(:transportation).permit(:train_line, :route, :run_number,
                                   :operator_id)
  end


end

class TransportationController < ApplicationController

	def index
		@transportation = Transportation.ordered.page(params[:page]).per(5)
	end

	def edit
		@single_transport = Transportation.find(params[:id])
	end

	def update
		@transport = Transportation.find(params[:id])
		if @transport.update_attributes(transport_params)
		  redirect_to :root
		else
			render 'transportation/edit'
		end
	end

	def new
		@new_transport = Transportation.new
	end

	def create
		@new_transport = Transportation.new(transport_params)
		if @new_transport.save
		  redirect_to :root
		else
		  flash.now[:error] = "This record did not save. Make sure to use El, Metra, or Amtrak as the train line (case sensitivity matters)" 
			render '/transportation/new'
		end

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

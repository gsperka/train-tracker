class TransportationController < ApplicationController

	def index
		@transportation = Transportation.ordered.page(params[:page]).per(5)
	end

	def edit
		@single_transport = Transportation.find(params[:id])
	end

	def update
		@transport = Transportation.find(params[:id])

		# p '-------------'
		# p params[:transportation][:run_number]
		# p '-------------'

		# p '-------------'
		# p Transportation.find_by(run_number: "A005")
		# p '-------------'

		# p '-------------'
		# p Transportation.find_run_number(params[:transportation][:run_number])
		# p '-------------'


		# p '----------------x'
		# p Transportation.find_by(run_number: params[:run_number])
		# p '----------------x'

		if Transportation.find_run_number(params[:transportation][:run_number]) == nil
			@transport.update_attributes(transport_params)
			@transport.save!
		  redirect_to :root
		else
			flash.now[:error] = "This record did not save. Please make sure the Run Number is unique" 
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
		  flash.now[:error] = "This record did not save. Make sure this has a unique Run Number and doesn't already exist." 
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

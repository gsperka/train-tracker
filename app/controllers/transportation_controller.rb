class TransportationController < ApplicationController

	def index
		@transportation = Transportation.ordered.page(params[:page]).per(5)
	end

	def edit
		@single_transport = Transportation.find(params[:id])
	end

	def destroy
		@remove = Transportation.find(params[:id])
		@remove.delete
		redirect_to(root_url)
	end


end

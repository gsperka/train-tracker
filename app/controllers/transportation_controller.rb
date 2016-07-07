class TransportationController < ApplicationController

	def index
		@transportation = Transportation.page(params[:page]).per(5)
	end


end

class TransportationController < ApplicationController

	def index
		@transportation = Transportation.order(:run_number)
	end


end

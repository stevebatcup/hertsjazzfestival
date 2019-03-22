class FilmsController < ApplicationController
	def index
		if params[:festival]
			@festival = Festival.find(params[:festival])
		else
			@festival = current_festival
		end
		@films = @festival.films
	end
end

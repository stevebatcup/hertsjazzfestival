class FestivalsController < ApplicationController
	def index
		if params[:festival]
			redirect_to festival_path(params[:festival])
		else
			@festivals = Festival.where(is_current: false)
		end
	end

	def show
		unless params[:id].present?
			@is_current = true
			@festival = Festival.where(is_current: true).first
		else
			@festival = Festival.find(params[:id])
			redirect_to root_path if @festival.is_current
			@is_current = false
		end
	end
end
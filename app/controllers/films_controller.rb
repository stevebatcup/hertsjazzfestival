class FilmsController < ApplicationController
	def index
		@films = current_festival.films
	end
end

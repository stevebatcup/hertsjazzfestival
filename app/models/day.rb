class Day < ApplicationRecord
	belongs_to	:festival
	has_many	:gigs
	default_scope	{ order(date: :desc) }

	def gig_list
		if self.festival.is_current?
			music_gigs
		else
			gigs
		end
	end

	def music_gigs
		@music_gigs ||= self.gigs.where(is_film: false).order(starts: :asc)
	end

	def film_gigs
		@film_gigs ||= self.gigs.where(is_film: true).order(starts: :asc)
	end

	def date_as_day_name
		self.date.strftime("%A")
	end
end

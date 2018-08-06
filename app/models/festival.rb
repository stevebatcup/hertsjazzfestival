class Festival < ApplicationRecord
	has_many	:days, dependent: :destroy
	belongs_to	:venue
	before_save	:build_dates

	def reverse_days
		self.days.reverse
	end

	def build_dates
		self.year = self.starts.strftime("%Y")
		day_count = ((self.ends - self.starts).to_i / 86400)
		puts day_count
		(0..(day_count)).each_with_index do |d, i|
			day_date = self.starts + d.days
			self.days.build(date: day_date, sort: i+1) unless Day.find_by(date: day_date, festival_id: self.id)
		end
	end

	def films
		@films ||= begin
			film_list = []
			self.days.each do |day|
				day.film_gigs.each do |gig|
					film_list << gig
				end
			end
		film_list
		end
	end

	def is_in_early_bird_period?
		Date.today <= self.early_bird_cutoff_date
	end

	def early_bird_cutoff_eve
		self.early_bird_cutoff_date - 1.day
	end
end

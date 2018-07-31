module ApplicationHelper
	def gig_price(price)
		number_to_currency(price, unit: '£')
	end

	def back_link(gig)
		if gig.day.festival.is_current? &&  gig.is_film
			link_to "< Back to films", films_path, id: 'back_to_festival'
		else
			link_to "< Back to festival", festival_path(gig.day.festival), id: 'back_to_festival'
		end
	end
end

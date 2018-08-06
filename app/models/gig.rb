class Gig < ApplicationRecord
	belongs_to	:day
	has_many	:performances
	has_many	:musicians, through: :performances

	mount_uploader :image, ImageUploader

	def precis
		"#{self.act} on #{self.starts.strftime("%A %B %e, %Y")}"
	end

	def self.next
		self.where("ends >= CURDATE()").order(ends: :asc).limit(1).first
	end

	def self.upcoming(amount=3, after='CURDATE()')
		self.where("ends > #{after}").order("ends").limit(amount)
	end

	def has_passed?
		self.day.date < Date.today
	end
end

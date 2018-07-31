require "administrate/field/base"

class TimeField < Administrate::Field::Base
  def to_s
    data
  end

  def time
    I18n.localize(
      data.in_time_zone(timezone).to_time,
      format: format,
    )
  end

private

	def format
	  options.fetch(:format, :default)
	end

	def timezone
	  options.fetch(:timezone, ::Time.zone.name || "UTC")
	end

end

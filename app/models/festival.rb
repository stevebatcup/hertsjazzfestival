class Festival < ApplicationRecord
  has_many	:days, dependent: :destroy
  belongs_to	:venue
  before_save	:build_dates

  def reverse_days
    days.reverse
  end

  def gigs
    @gigs ||= begin
      gigs = []
      days.each do |day|
        day.gigs.each do |gig|
          gigs << gig
        end
      end
      gigs
    end
  end

  def build_dates
    self.year = starts.strftime("%Y")
    day_count = ((ends - starts).to_i / 86400)
    puts day_count
    (0..day_count).each_with_index do |d, i|
      day_date = starts + d.days
      days.build(date: day_date, sort: i + 1) unless Day.find_by(date: day_date, festival_id: id)
    end
  end

  def films
    @films ||= begin
      film_list = []
      reverse_days.each do |day|
        day.film_gigs.each do |gig|
          film_list << gig
        end
      end
      film_list
    end
  end

  def is_in_earlybird_period?
    if earlybird_cutoff_date.nil? || is_in_super_earlybird_period?
      false
    else
      Date.today <= earlybird_cutoff_date
    end
  end

  def is_in_super_earlybird_period?
    if super_earlybird_cutoff_date.nil?
      false
    else
      Date.today <= super_earlybird_cutoff_date
    end
  end

  def earlybird_cutoff_eve
    earlybird_cutoff_date - 1.day
  end

  def super_earlybird_cutoff_eve
    super_earlybird_cutoff_date - 1.day
  end
end

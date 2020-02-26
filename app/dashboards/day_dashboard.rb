require "administrate/base_dashboard"

class DayDashboard < Administrate::BaseDashboard
  # ATTRIBUTE_TYPES
  # a hash that describes the type of each of the model's fields.
  #
  # Each different type represents an Administrate::Field object,
  # which determines how the attribute is displayed
  # on pages throughout the dashboard.
  ATTRIBUTE_TYPES = {
    date_as_day_name: Field::String.with_options(searchable: false),
    festival: Field::BelongsTo,
    gigs: Field::HasMany,
    id: Field::Number,
    date: Field::DateTime,
    day_standard_price: Field::String.with_options(searchable: false),
    day_members_price: Field::String.with_options(searchable: false),
    day_students_price: Field::String.with_options(searchable: false),
    earlybird_standard_price: Field::String.with_options(searchable: false),
    earlybird_members_price: Field::String.with_options(searchable: false),
    earlybird_students_price: Field::String.with_options(searchable: false),
    super_earlybird_standard_price: Field::String.with_options(searchable: false),
    super_earlybird_members_price: Field::String.with_options(searchable: false),
    super_earlybird_students_price: Field::String.with_options(searchable: false),
    booking_url: Field::String,
    sort: Field::Number,
  }.freeze

  # COLLECTION_ATTRIBUTES
  # an array of attributes that will be displayed on the model's index page.
  #
  # By default, it's limited to four items to reduce clutter on index pages.
  # Feel free to add, remove, or rearrange items.
  COLLECTION_ATTRIBUTES = [
    :festival,
    :date_as_day_name,
  ].freeze

  # SHOW_PAGE_ATTRIBUTES
  # an array of attributes that will be displayed on the model's show page.
  SHOW_PAGE_ATTRIBUTES = [
    :day_standard_price,
    :day_members_price,
    :day_students_price,
    :earlybird_standard_price,
    :earlybird_members_price,
    :earlybird_students_price,
    :super_earlybird_standard_price,
    :super_earlybird_members_price,
    :super_earlybird_students_price,
    :booking_url
  ].freeze

  # FORM_ATTRIBUTES
  # an array of attributes that will be displayed
  # on the model's form (`new` and `edit`) pages.
  FORM_ATTRIBUTES = [
    :day_standard_price,
    :day_members_price,
    :day_students_price,
    :earlybird_standard_price,
    :earlybird_members_price,
    :earlybird_students_price,
    :super_earlybird_standard_price,
    :super_earlybird_members_price,
    :super_earlybird_students_price,
    :booking_url
  ].freeze

  # Overwrite this method to customize how days are displayed
  # across all pages of the admin dashboard.
  #
  def display_resource(day)
    "#{day.date.strftime("%A")} at #{day.festival.year} festival"
  end
end

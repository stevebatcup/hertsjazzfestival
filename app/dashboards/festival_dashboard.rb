require "administrate/base_dashboard"

class FestivalDashboard < Administrate::BaseDashboard
  # ATTRIBUTE_TYPES
  # a hash that describes the type of each of the model's fields.
  #
  # Each different type represents an Administrate::Field object,
  # which determines how the attribute is displayed
  # on pages throughout the dashboard.
  ATTRIBUTE_TYPES = {
    starts: Field::DateTime,
    ends: Field::DateTime,
    venue: Field::BelongsTo,
    id: Field::Number,
    year: Field::String,
    gallery_url: Field::String,
    is_current: Field::Boolean,
    weekend_standard_price: Field::String.with_options(searchable: false),
    weekend_members_price: Field::String.with_options(searchable: false),
    weekend_students_price: Field::String.with_options(searchable: false),
    earlybird_standard_price: Field::String.with_options(searchable: false),
    earlybird_members_price: Field::String.with_options(searchable: false),
    earlybird_students_price: Field::String.with_options(searchable: false),
    super_earlybird_standard_price: Field::String.with_options(searchable: false),
    super_earlybird_members_price: Field::String.with_options(searchable: false),
    super_earlybird_students_price: Field::String.with_options(searchable: false),
    booking_url: Field::String,
    meta_description: Field::Text,
    created_at: Field::DateTime,
    updated_at: Field::DateTime,
    earlybird_cutoff_date: Field::DateTime,
    super_earlybird_cutoff_date: Field::DateTime
  }.freeze

  # COLLECTION_ATTRIBUTES
  # an array of attributes that will be displayed on the model's index page.
  #
  # By default, it's limited to four items to reduce clutter on index pages.
  # Feel free to add, remove, or rearrange items.
  COLLECTION_ATTRIBUTES = [
    :year,
    :venue,
  ].freeze

  # SHOW_PAGE_ATTRIBUTES
  # an array of attributes that will be displayed on the model's show page.
  SHOW_PAGE_ATTRIBUTES = [
    :venue,
    :id,
    :year,
    :gallery_url,
    :is_current,
    :weekend_standard_price,
    :weekend_members_price,
    :weekend_students_price,
    :earlybird_standard_price,
    :earlybird_members_price,
    :earlybird_students_price,
    :super_earlybird_standard_price,
    :super_earlybird_members_price,
    :super_earlybird_students_price,
    :booking_url,
    :created_at,
    :updated_at,
  ].freeze

  # FORM_ATTRIBUTES
  # an array of attributes that will be displayed
  # on the model's form (`new` and `edit`) pages.
  FORM_ATTRIBUTES = [
    :venue,
    :starts,
    :ends,
    :gallery_url,
    :is_current,
    :weekend_standard_price,
    :weekend_members_price,
    :weekend_students_price,
    :earlybird_cutoff_date,
    :earlybird_standard_price,
    :earlybird_members_price,
    :earlybird_students_price,
    :super_earlybird_cutoff_date,
    :super_earlybird_standard_price,
    :super_earlybird_members_price,
    :super_earlybird_students_price,
    :booking_url,
    :meta_description
  ].freeze

  # Overwrite this method to customize how festivals are displayed
  # across all pages of the admin dashboard.
  #
  def display_resource(festival)
    "#{festival.year} Festival"
  end
end

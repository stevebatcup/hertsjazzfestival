require "administrate/base_dashboard"

class GigDashboard < Administrate::BaseDashboard
  # ATTRIBUTE_TYPES
  # a hash that describes the type of each of the model's fields.
  #
  # Each different type represents an Administrate::Field object,
  # which determines how the attribute is displayed
  # on pages throughout the dashboard.
  ATTRIBUTE_TYPES = {
    id: Field::Number,
    day: Field::BelongsTo,
    act: Field::String,
    starts: TimeField.with_options(format: "%H:%M", timezone: "Europe/London"),
    ends: TimeField.with_options(format: "%H:%M", timezone: "Europe/London"),
    performances: PerformanceField,
    description: Field::Text,
    image: ImageField,
    is_film: Field::Boolean,
    website: Field::String,
    booking_url: Field::String,
    video_url: StringWithHintField.with_options(
      hint: "<a href='https://docs.joeworkman.net/rapidweaver/stacks/youtube/video-id' target='_blank'>Where do I find the video ID on YouTube?</a> ".html_safe
    ),
    standard_price: Field::String.with_options(searchable: false),
    members_price: Field::String.with_options(searchable: false),
    students_price: Field::String.with_options(searchable: false),
    created_at: Field::DateTime,
    updated_at: Field::DateTime,
  }.freeze

  # COLLECTION_ATTRIBUTES
  # an array of attributes that will be displayed on the model's index page.
  #
  # By default, it's limited to four items to reduce clutter on index pages.
  # Feel free to add, remove, or rearrange items.
  COLLECTION_ATTRIBUTES = [
    :act,
    :day
  ].freeze

  # SHOW_PAGE_ATTRIBUTES
  # an array of attributes that will be displayed on the model's show page.
  SHOW_PAGE_ATTRIBUTES = [].freeze

  # FORM_ATTRIBUTES
  # an array of attributes that will be displayed
  # on the model's form (`new` and `edit`) pages.
  FORM_ATTRIBUTES = [
    :day,
    :starts,
    :ends,
    :act,
    :performances,
    :description,
    :image,
    :website,
    :video_url,
    :booking_url,
    :standard_price,
    :members_price,
    :students_price,
    :is_film
  ].freeze

  # Overwrite this method to customize how gigs are displayed
  # across all pages of the admin dashboard.
  #
  # def display_resource(gig)
  #   "Gig ##{gig.id}"
  # end
end

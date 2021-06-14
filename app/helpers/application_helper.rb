module ApplicationHelper
  def page_title(text)
    content_for :page_title, text
  end

  def meta_tag(tag, text)
    content_for :"meta_#{tag}", text
  end

  def yield_meta_tag(tag, default_text = "")
    content_for?(:"meta_#{tag}") ? content_for(:"meta_#{tag}") : default_text
  end

  def gig_price(price)
    number_to_currency(price, unit: "£")
  end

  def back_link(gig)
    if gig.day.festival.is_current? && gig.is_film
      link_to "< Back to films", films_path, id: "back_to_festival"
    else
      link_to "< Back to festival", festival_path(gig.day.festival), id: "back_to_festival"
    end
  end

  def festival_date_coverage_sentence(festival)
    ends = festival.ends.strftime("%d")
    festival.starts.strftime("%B %d - #{ends}, %Y")
  end
end

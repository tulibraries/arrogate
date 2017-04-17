module ApplicationHelper
  def libguide_link options={}
    link = options[:document]["url_fulltext_display"].first
    title = options[:document]["title_display"]
    link_to title, link
  end
end

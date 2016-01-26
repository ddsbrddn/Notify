module ApplicationHelper
  # Return the full title on a per_page basis.
  def full_title(page_title = '')
    base_title = "In-App Notification With Rails"
    if page_title.empty?
      base_title
    else
      page_title + " | " + base_title
    end
  end
end

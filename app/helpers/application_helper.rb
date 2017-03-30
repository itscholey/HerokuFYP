module ApplicationHelper
  def full_title(page_title = '')
    base_title = "FYP Rails App, Chloe Barnes"
    if page_title.empty?
      base_title
    else
      page_title + " | " + base_title
    end
  end

  def format_datetime(date)
    date.strftime("%H:%M, %-d %B %Y")
  end
end

module ApplicationHelper
  def full_title(title = '')
    default_title = "MyApp"
    if title.blank?
     default_title
    else
      "#{title} | #{default_title}"
    end
  end  
end

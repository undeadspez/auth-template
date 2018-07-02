module ApplicationHelper

  def full_title(title)
    if title
      "Auth template | #{title}"
    else
      "Auth template"
    end
  end
  
end

module ApplicationHelper

  def full_title(title)
    if title
      "#{title} | #{Rails.configuration.app_name}"
    else
      "#{Rails.configuration.app_name}"
    end
  end
  
end

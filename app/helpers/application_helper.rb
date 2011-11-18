module ApplicationHelper
  
  def logo
    logo = image_tag("logo.png", :alt => "Sample App", :class => "round")
    return logo
  end
  
  #Deal with titles
  def title
    base_title = "Ruby on Rails Tutorial Sample App"
    if @title.nil?
      base_title
    else
      "#{base_title} | #{@title}"
    end
  end
end

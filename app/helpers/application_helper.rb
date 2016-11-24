module ApplicationHelper
  def full_title(page_title = '')
    base_title = "Procore - Sales Engineering App"
    if page_title.empty?
      base_title
    else
      page_title + " | " + base_title
    end
  end

  def sortable(column, title = nil)
    title ||= column.titleize
    if sort_direction == "asc"
      class_direction = "arrow-up"
    elsif sort_direction == "desc"
      class_direction = "arrow-down"
    end
    css_class = column == sort_column ? "glyphicon glyphicon-#{class_direction}" : nil
    direction = column == sort_column && sort_direction == "asc" ? "desc" : "asc"
    link_to title, {:sort => column, :direction => direction}, {:class => css_class}
  end
end

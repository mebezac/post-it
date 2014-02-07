module ApplicationHelper
  def fix_url(str)
    str.starts_with?('http://') ? str : "http://#{str}"
  end

  def display_datetime(dt)
    dt.strftime("%m/%d/%Y %l:%M%P %Z")
    
  end

  def sort_by_votes(array_of_objects)
    array_of_objects.sort_by{|x|x.total_votes}.reverse
  end
end

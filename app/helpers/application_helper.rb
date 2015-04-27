module ApplicationHelper
  def flash_class(level)

    case level
    when :notice then "alert-info"
    when :info then "alert-info"
    when :success then "alert-success"
    when :error then "alert-danger"
    when :alert then "alert-warning"
    when :warn then "alert-warning"
    else
      level
    end
  end
end

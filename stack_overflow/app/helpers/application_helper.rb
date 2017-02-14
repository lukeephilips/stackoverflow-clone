module ApplicationHelper
  def flash_class(key)
    if (key == "notice")
      "alert alert-success"
    elsif (key =="alert")
      "alert alert-danger"

    end
  end
end

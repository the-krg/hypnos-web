module ApplicationHelper
  def night?
    time = Time.now.hour

    time > 17 || time < 6
  end
end
